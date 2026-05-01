#!/usr/bin/env python3
"""
import_exchange_allocations_from_excel.py

Reads DVS_Exchange_Allocations.xlsx and injects 'flow of' lines into the
matching interface def blocks in Parts_generated.sysml.

Used columns: Component Exchange Name, Functional Exchange Name, Allocation ID

For each (component exchange, functional exchange) row the script:
  1. Adds 'item feUsage : FEType;' into every non-conjugated port def that the
     interface def references, so that 'portName.feUsage' resolves in SysML.
  2. Appends inside the matching interface def:
       flow of FEType from firstEndPort.feUsage to secondEndPort.feUsage;

The port def injection uses a sentinel comment so the step is idempotent:
  • '/* exchange allocation items */' is written on the first line of every
    injected body.  On re-run the body is stripped back to 'port def Name;'
    before re-injection.

The script is idempotent: existing 'flow of' lines and existing allocation
items are stripped before re-injection.

Usage:
  python import_exchange_allocations_from_excel.py [input.xlsx] [parts.sysml]

Defaults:
  input : DVS/data/DVS_Exchange_Allocations.xlsx
  parts : DVS/Parts_generated.sysml
"""

import pathlib
import re
import subprocess
import sys
from dataclasses import dataclass
from typing import Dict, List, Optional, Tuple

try:
    import openpyxl
except ImportError:
    print("Error: openpyxl is required. Install it with: pip install openpyxl", file=sys.stderr)
    sys.exit(1)

INDENT = "    "
ALLOC_MARKER = "/* exchange allocation items */"


# ---------------------------------------------------------------------------
# Data model
# ---------------------------------------------------------------------------

@dataclass(frozen=True)
class ExchangeAllocation:
    component_exchange_name: str  # raw name, e.g. "Ground station - Antenna - UHF"
    functional_exchange_name: str  # raw name, e.g. "Uplink Image Data"
    allocation_id: str


# ---------------------------------------------------------------------------
# Name helpers
# ---------------------------------------------------------------------------

def to_type_name(name: str) -> str:
    """Convert a raw name to PascalCase SysML type identifier.
    ALL-CAPS abbreviations (UHF, OBC, I2C …) are preserved as-is.
    """
    words = re.split(r"[\s/\-_]+", name.strip())
    result = []
    for word in words:
        cleaned = re.sub(r"[^A-Za-z0-9]", "", word)
        if not cleaned:
            continue
        if cleaned.isupper() and len(cleaned) > 1:
            result.append(cleaned)
        else:
            result.append(cleaned[0].upper() + cleaned[1:])
    return "".join(result)


def to_usage_name(name: str) -> str:
    """Convert a raw name to camelCase SysML usage identifier.
    Initial ALL-CAPS abbreviations are lowercased as a group.
    """
    type_name = to_type_name(name)
    if not type_name:
        return name

    n = len(type_name)
    end_prefix = 0
    for i in range(n):
        ch = type_name[i]
        if ch.isupper():
            next_is_lower = (i + 1 < n and type_name[i + 1].islower())
            if next_is_lower and i > 0:
                end_prefix = i
                break
            else:
                end_prefix = i + 1
        else:
            break

    if end_prefix == 0:
        end_prefix = 1

    return type_name[:end_prefix].lower() + type_name[end_prefix:]


def to_exchange_name(raw_name: str) -> str:
    """Convert a CE name to the SysML interface/connection def identifier.
    Matches the convention used by import_component_exchanges_from_excel.py.
    """
    name = raw_name.replace("-", "_")
    name = name.replace(" ", "")
    name = re.sub(r"_+", "_", name)
    return name.strip("_")


# ---------------------------------------------------------------------------
# Excel parsing
# ---------------------------------------------------------------------------

def load_allocations(path: pathlib.Path) -> List[ExchangeAllocation]:
    wb = openpyxl.load_workbook(path, data_only=True)
    ws = wb.active
    rows = list(ws.iter_rows(values_only=True))

    if not rows:
        return []

    header = [str(c).strip() if c else "" for c in rows[0]]
    try:
        ce_col = header.index("Component Exchange Name")
        fe_col = header.index("Functional Exchange Name")
        id_col = header.index("Allocation ID")
    except ValueError as exc:
        print(f"Error: required column not found in header: {exc}", file=sys.stderr)
        sys.exit(1)

    seen: set = set()
    allocations: List[ExchangeAllocation] = []
    for row in rows[1:]:
        row = list(row) + [None] * 20
        ce = str(row[ce_col]).strip() if row[ce_col] else ""
        fe = str(row[fe_col]).strip() if row[fe_col] else ""
        aid = str(row[id_col]).strip() if row[id_col] else ""
        if not (ce and fe and aid):
            continue
        key = (ce, fe, aid)
        if key in seen:
            continue
        seen.add(key)
        allocations.append(ExchangeAllocation(ce, fe, aid))

    return allocations


# ---------------------------------------------------------------------------
# SysML text manipulation helpers
# ---------------------------------------------------------------------------

def _find_block_end(content: str, open_brace_pos: int) -> int:
    """Return the index of the '}' that closes the '{' at open_brace_pos."""
    depth = 0
    for i in range(open_brace_pos, len(content)):
        if content[i] == "{":
            depth += 1
        elif content[i] == "}":
            depth -= 1
            if depth == 0:
                return i
    return -1


def _strip_flow_lines(content: str) -> str:
    """Remove all 'flow of ...' lines injected by this script."""
    lines = content.split("\n")
    result = [line for line in lines if not re.match(r"^\s+flow\s+of\b", line)]
    return "\n".join(result)


def _strip_allocation_port_items(content: str) -> str:
    """Revert port defs whose body was injected by this script back to 'port def Name;'.

    Recognises injected bodies by the ALLOC_MARKER sentinel comment.
    """
    pattern = re.compile(
        r"([ \t]+)port\s+def\s+(\w+)\s*\{"
        r"[^{}]*?" + re.escape(ALLOC_MARKER) + r"[^{}]*?\}",
        re.DOTALL,
    )
    return pattern.sub(lambda m: f"{m.group(1)}port def {m.group(2)};", content)


def _find_interface_port_info(content: str, iface_name: str) -> List[Tuple[str, str, bool]]:
    """Parse (port_name, port_type, is_conjugated) for each end port in an interface def.

    'is_conjugated' is True when the port is typed as '~PortType'.
    Returns [] if the interface def is not found.
    """
    pattern = rf"\binterface\s+def\s+{re.escape(iface_name)}\s*\{{"
    m = re.search(pattern, content)
    if not m:
        return []

    open_brace_pos = m.end() - 1
    close_pos = _find_block_end(content, open_brace_pos)
    if close_pos == -1:
        return []

    block = content[open_brace_pos : close_pos + 1]
    # Groups: (port_name, tilde, port_type)
    raw = re.findall(r"\bend\s+port\s+(\w+)\s*:\s*(~?)(\w+)\s*;", block)
    return [(name, ptype, tilde == "~") for name, tilde, ptype in raw]


def _ensure_port_def_has_item(
    content: str, port_def_name: str, fe_type: str, fe_usage: str, direction: str = "out"
) -> str:
    """Ensure 'direction item feUsage : feType;' is present in the named port def's body.

    • If the port def already has a body: adds the item line before the closing '}'
      (unless the item is already present).
    • If the port def is a bare semicolon form ('port def Name;'): converts it to
      a body form marked with ALLOC_MARKER so the step can be reversed on re-run.
    """
    item_line = f"{INDENT * 2}{direction} item {fe_usage} : {fe_type};"

    # Case 1: port def already has a body
    pattern_body = re.compile(rf"\bport\s+def\s+{re.escape(port_def_name)}\s*\{{")
    m = pattern_body.search(content)
    if m:
        open_brace_pos = m.end() - 1
        close_pos = _find_block_end(content, open_brace_pos)
        if close_pos == -1:
            return content
        block = content[open_brace_pos : close_pos + 1]
        if re.search(rf"\bitem\s+{re.escape(fe_usage)}\s*:", block):
            return content  # item already present
        line_start = content.rfind("\n", 0, close_pos) + 1
        return content[:line_start] + item_line + "\n" + content[line_start:]

    # Case 2: bare semicolon form — convert to a body with the marker
    pattern_semi = re.compile(rf"([ \t]+)port\s+def\s+{re.escape(port_def_name)}\s*;")
    m = pattern_semi.search(content)
    if not m:
        print(
            f"Warning: 'port def {port_def_name}' not found; item '{fe_usage}' not added.",
            file=sys.stderr,
        )
        return content

    indent = m.group(1)
    new_def = (
        f"{indent}port def {port_def_name} {{\n"
        f"{indent}{INDENT}{ALLOC_MARKER}\n"
        f"{item_line}\n"
        f"{indent}}}"
    )
    return content[: m.start()] + new_def + content[m.end() :]


def _build_flow_line(fe_type: str, fe_usage: str, from_port: str, to_port: str) -> str:
    """Build a 'flow of' line at interface-def body indentation (2 levels)."""
    i2 = INDENT * 2
    return f"{i2}flow of {fe_type} from {from_port}.{fe_usage} to {to_port}.{fe_usage};"


def _insert_into_interface_def(
    content: str, iface_name: str, flow_lines: List[str]
) -> str:
    """Insert flow_lines before the closing '}' of 'interface def iface_name { ... }'."""
    pattern = rf"\binterface\s+def\s+{re.escape(iface_name)}\s*\{{"
    m = re.search(pattern, content)
    if not m:
        print(
            f"Warning: 'interface def {iface_name}' not found; flows skipped.",
            file=sys.stderr,
        )
        return content

    open_brace_pos = m.end() - 1
    close_pos = _find_block_end(content, open_brace_pos)
    if close_pos == -1:
        print(
            f"Warning: unmatched '{{' for 'interface def {iface_name}'.",
            file=sys.stderr,
        )
        return content

    line_start = content.rfind("\n", 0, close_pos) + 1
    insert_text = "\n".join(flow_lines) + "\n"
    return content[:line_start] + insert_text + content[line_start:]


# ---------------------------------------------------------------------------
# Main injection logic
# ---------------------------------------------------------------------------

def inject_allocations(parts_content: str, allocations: List[ExchangeAllocation]) -> str:
    """Inject 'flow of' lines (and required port-def items) for each allocation.

    Steps:
      1. Strip previously injected flow lines and port-def item bodies (idempotency).
      2. Group allocations by component exchange SysML name.
      3. For each CE, parse its interface def to get (port_name, port_type, conjugated).
      4. For each FE in the group:
           a. Add 'item feUsage : feType;' to every non-conjugated port def referenced
              by the interface (conjugated ports inherit the item from the base type).
           b. Build a 'flow of' line referencing fromPort.feUsage → toPort.feUsage.
      5. Insert all flow lines into the interface def.
    """
    content = _strip_flow_lines(parts_content)
    content = _strip_allocation_port_items(content)

    by_ce: Dict[str, List[ExchangeAllocation]] = {}
    for alloc in allocations:
        key = to_exchange_name(alloc.component_exchange_name)
        by_ce.setdefault(key, []).append(alloc)

    for ce_sysml_name, allocs in by_ce.items():
        iface_name = f"{ce_sysml_name}_Interface"
        port_info = _find_interface_port_info(content, iface_name)

        if len(port_info) < 2:
            print(
                f"Warning: could not resolve two end ports for '{iface_name}'; "
                f"flows skipped.",
                file=sys.stderr,
            )
            continue

        from_port_name, from_port_type, from_conj = port_info[0]
        to_port_name, to_port_type, to_conj = port_info[1]

        flow_lines: List[str] = []
        for alloc in allocs:
            fe_type = to_type_name(alloc.functional_exchange_name)
            fe_usage = to_usage_name(alloc.functional_exchange_name)

            # Only add items to non-conjugated port defs; conjugated types
            # inherit the item (with reversed direction) automatically.
            if not from_conj:
                content = _ensure_port_def_has_item(
                    content, from_port_type, fe_type, fe_usage, direction="out"
                )
            if not to_conj:
                content = _ensure_port_def_has_item(
                    content, to_port_type, fe_type, fe_usage, direction="in"
                )

            flow_lines.append(
                _build_flow_line(fe_type, fe_usage, from_port_name, to_port_name)
            )

        content = _insert_into_interface_def(content, iface_name, flow_lines)

    return content


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def main() -> None:
    _DVS_DIR = pathlib.Path(__file__).parent.parent
    DEFAULT_INPUT = _DVS_DIR / "data" / "DVS_Exchange_Allocations.xlsx"
    DEFAULT_PARTS = _DVS_DIR / "Parts_generated.sysml"

    args = sys.argv[1:]
    if args and args[0] in ("-h", "--help"):
        print(__doc__)
        sys.exit(0)

    input_path = pathlib.Path(args[0]) if args else DEFAULT_INPUT
    if not input_path.exists():
        print(f"Error: input file not found: {input_path}", file=sys.stderr)
        sys.exit(1)

    parts_path = pathlib.Path(args[1]) if len(args) >= 2 else DEFAULT_PARTS
    if not parts_path.exists():
        print(f"Error: parts file not found: {parts_path}", file=sys.stderr)
        sys.exit(1)

    print(f"Reading allocations : {input_path}")
    allocations = load_allocations(input_path)
    if not allocations:
        print("No allocations found. Check the column layout.", file=sys.stderr)
        sys.exit(1)
    print(f"Found               : {len(allocations)} unique allocations")

    print(f"Reading parts file  : {parts_path}")
    parts_content = parts_path.read_text(encoding="utf-8")

    print("Injecting flow allocations...")
    updated = inject_allocations(parts_content, allocations)

    parts_path.write_text(updated, encoding="utf-8")
    print(f"Written             : {parts_path}")

    result = subprocess.run(
        ["syside", "check", str(parts_path.parent)],
        capture_output=True, text=True,
    )
    if result.stdout:
        print(result.stdout, end="")
    if result.returncode != 0:
        print("syside validation errors:", file=sys.stderr)
        if result.stderr:
            print(result.stderr, file=sys.stderr)
        sys.exit(1)
    print("Validation          : OK")


if __name__ == "__main__":
    main()
