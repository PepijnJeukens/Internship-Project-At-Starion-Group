#!/usr/bin/env python3
"""
import_functional_chains_from_excel.py
Reads DVS_Functional_Chains.xlsx and augments Functions_generated.sysml with:
  - action def {ChainName}_{id4}  for each functional chain
    containing a doc /* ID: ... */ comment, the involved exchanges,
    and sequential first/then action usages for each function in order.
"""

import pathlib
import re
import subprocess
import sys
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Set, Tuple

try:
    import openpyxl
except ImportError:
    print("Error: openpyxl is required. Install it with: pip install openpyxl", file=sys.stderr)
    sys.exit(1)

INDENT = "    "

# ---------------------------------------------------------------------------
# Data model
# ---------------------------------------------------------------------------

@dataclass
class FunctionalChain:
    chain_id: str
    chain_name: str
    start_function_id: str
    start_function_name: str
    end_function_id: str
    end_function_name: str
    function_ids: List[str] = field(default_factory=list)
    function_names: List[str] = field(default_factory=list)
    exchange_ids: List[str] = field(default_factory=list)
    exchange_names: List[str] = field(default_factory=list)

# ---------------------------------------------------------------------------
# Name helpers
# ---------------------------------------------------------------------------

def to_type_name(name: str, item_id: str = "") -> str:
    """Convert a name to PascalCase SysML identifier.
    ALL-CAPS abbreviations (EPS, OBC, ADCS) are preserved as-is.
    Appends first 4 characters of ID to ensure uniqueness.
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
    type_name = "".join(result)

    if item_id:
        id_prefix = item_id[:4]
        return f"{type_name}_{id_prefix}"
    return type_name

def to_usage_name(name: str, item_id: str = "") -> str:
    """Convert a name to camelCase SysML usage identifier.
    Initial ALL-CAPS abbreviations are lowercased as a group.
    Appends first 4 characters of ID to ensure uniqueness.
    """
    type_name = to_type_name(name, item_id)
    if not type_name:
        return name

    underscore_pos = type_name.find('_')
    if underscore_pos != -1:
        name_part = type_name[:underscore_pos]
        id_part = type_name[underscore_pos:]
    else:
        name_part = type_name
        id_part = ""

    n = len(name_part)
    end_prefix = 0
    for i in range(n):
        ch = name_part[i]
        if ch.isupper():
            next_is_lower = (i + 1 < n and name_part[i + 1].islower())
            if next_is_lower and i > 0:
                end_prefix = i
                break
            else:
                end_prefix = i + 1
        else:
            break

    if end_prefix == 0:
        end_prefix = 1

    camel_name = name_part[:end_prefix].lower() + name_part[end_prefix:]
    return f"{camel_name}{id_part}"

# ---------------------------------------------------------------------------
# Excel column detection
# ---------------------------------------------------------------------------

def _detect_column_groups(header: Tuple) -> Tuple[List[Tuple[int, int]], List[Tuple[int, int]]]:
    """Detect function and exchange column groups from the header row.

    Returns:
        function_cols: list of (id_col, name_col) index pairs for each Function N
        exchange_cols: list of (id_col, name_col) index pairs for each Exchange N
    """
    function_cols: List[Tuple[int, int]] = []
    exchange_cols: List[Tuple[int, int]] = []

    n = 1
    while True:
        id_label = f"Function {n} ID"
        name_label = f"Function {n} Name"
        try:
            id_col = header.index(id_label)
            name_col = header.index(name_label)
            function_cols.append((id_col, name_col))
            n += 1
        except ValueError:
            break

    n = 1
    while True:
        id_label = f"Exchange {n} ID"
        name_label = f"Exchange {n} Name"
        try:
            id_col = header.index(id_label)
            name_col = header.index(name_label)
            exchange_cols.append((id_col, name_col))
            n += 1
        except ValueError:
            break

    return function_cols, exchange_cols

# ---------------------------------------------------------------------------
# Excel parsing
# ---------------------------------------------------------------------------

def load_chains(path: pathlib.Path) -> List[FunctionalChain]:
    wb = openpyxl.load_workbook(path, data_only=True)
    ws = wb.active
    rows = list(ws.iter_rows(values_only=True))

    if not rows:
        return []

    header = rows[0]
    function_cols, exchange_cols = _detect_column_groups(header)

    if not function_cols:
        print("Warning: no 'Function N ID/Name' columns found in header.", file=sys.stderr)
    if not exchange_cols:
        print("Warning: no 'Exchange N ID/Name' columns found in header.", file=sys.stderr)

    print(f"Detected: {len(function_cols)} function column group(s), "
          f"{len(exchange_cols)} exchange column group(s)")

    try:
        chain_id_col = header.index("Functional Chain ID")
        chain_name_col = header.index("Functional Chain Name")
        start_fn_id_col = header.index("Start Function ID")
        start_fn_name_col = header.index("Start Function Name")
        end_fn_id_col = header.index("End Function ID")
        end_fn_name_col = header.index("End Function Name")
    except ValueError as exc:
        print(f"Error: required column not found in header: {exc}", file=sys.stderr)
        sys.exit(1)

    chains: List[FunctionalChain] = []
    for row in rows[1:]:        # skip header row
        if not any(row):
            continue

        chain_id = row[chain_id_col]
        chain_name = row[chain_name_col]
        if not chain_id or not chain_name:
            continue

        function_ids: List[str] = []
        function_names: List[str] = []
        for id_col, name_col in function_cols:
            fid = row[id_col]
            fname = row[name_col]
            if fid:
                function_ids.append(str(fid).strip())
                function_names.append(str(fname).strip() if fname else "")

        exchange_ids: List[str] = []
        exchange_names: List[str] = []
        for id_col, name_col in exchange_cols:
            eid = row[id_col]
            ename = row[name_col]
            if eid:
                exchange_ids.append(str(eid).strip())
                exchange_names.append(str(ename).strip() if ename else "")

        chains.append(FunctionalChain(
            chain_id=str(chain_id).strip(),
            chain_name=str(chain_name).strip(),
            start_function_id=str(row[start_fn_id_col]).strip() if row[start_fn_id_col] else "",
            start_function_name=str(row[start_fn_name_col]).strip() if row[start_fn_name_col] else "",
            end_function_id=str(row[end_fn_id_col]).strip() if row[end_fn_id_col] else "",
            end_function_name=str(row[end_fn_name_col]).strip() if row[end_fn_name_col] else "",
            function_ids=function_ids,
            function_names=function_names,
            exchange_ids=exchange_ids,
            exchange_names=exchange_names,
        ))

    return chains

# ---------------------------------------------------------------------------
# SysML file introspection
# ---------------------------------------------------------------------------

def parse_id_to_def_name(sysml_text: str) -> Dict[str, str]:
    """Return mapping of action ID -> action def name from the SysML content."""
    id_to_name: Dict[str, str] = {}
    for m in re.finditer(
        r"\baction def\s+(\w+)\s*\{[^{]*?/\* ID: ([0-9a-f-]+) \*/",
        sysml_text,
        re.DOTALL,
    ):
        id_to_name[m.group(2)] = m.group(1)
    return id_to_name

def parse_existing_action_def_names(sysml_text: str) -> Set[str]:
    """Return all action def names already present in the SysML text."""
    return set(re.findall(r"\baction def\s+(\w+)", sysml_text))

# ---------------------------------------------------------------------------
# SysML generation
# ---------------------------------------------------------------------------

def _make_chain_def_lines(
    chain: FunctionalChain,
    id_to_def_name: Dict[str, str],
) -> List[str]:
    """Generate the action def lines for a single functional chain."""
    chain_type = to_type_name(chain.chain_name, chain.chain_id)

    lines = [
        f"{INDENT}action def {chain_type} {{",
        f"{INDENT * 2}doc",
        f"{INDENT * 2}/* ID: {chain.chain_id} */",
    ]

    # List involved exchanges as a doc comment
    if chain.exchange_names:
        exchange_type_names = [to_type_name(n) for n in chain.exchange_names if n]
        lines.append(f"{INDENT * 2}/* Exchanges: {', '.join(exchange_type_names)} */")

    lines.append(f"{INDENT * 2}first start;")

    # Sequential then statements for each function in order
    for func_id, func_name in zip(chain.function_ids, chain.function_names):
        # Look up exact action def name by ID; fall back to computed name
        action_type = id_to_def_name.get(func_id, to_type_name(func_name, func_id))
        action_usage = to_usage_name(func_name, func_id)
        lines.append(f"{INDENT * 2}then action {action_usage} : {action_type};")

    lines.append(f"{INDENT}}}")
    lines.append("")

    return lines

# ---------------------------------------------------------------------------
# SysML injection
# ---------------------------------------------------------------------------

def inject_chains(sysml_text: str, chains: List[FunctionalChain]) -> str:
    """Return the SysML text augmented with functional chain action defs."""
    id_to_def_name = parse_id_to_def_name(sysml_text)
    existing_names = parse_existing_action_def_names(sysml_text)

    append_lines: List[str] = []

    for chain in chains:
        chain_type = to_type_name(chain.chain_name, chain.chain_id)
        if chain_type in existing_names:
            print(f"  Skipping (already exists): {chain_type}")
            continue
        existing_names.add(chain_type)
        append_lines.extend(_make_chain_def_lines(chain, id_to_def_name))

    if not append_lines:
        return sysml_text

    # Insert before the last closing brace of the package
    result = sysml_text.split("\n")
    closing_idx: Optional[int] = None
    for i in range(len(result) - 1, -1, -1):
        if result[i].strip() == "}":
            closing_idx = i
            break

    if closing_idx is None:
        result.extend(append_lines)
        result.append("}")
    else:
        result = result[:closing_idx] + append_lines + result[closing_idx:]

    return "\n".join(result)

# ---------------------------------------------------------------------------
# Validation
# ---------------------------------------------------------------------------

def validate(sysml_path: pathlib.Path) -> bool:
    try:
        proc = subprocess.run(
            ["syside", "check", str(sysml_path)],
            capture_output=True, text=True
        )
        output = proc.stdout + proc.stderr
        if proc.returncode != 0 or "error" in output.lower():
            print("Validation errors:")
            print(output)
            return False
        print("Validation passed.")
        return True
    except FileNotFoundError:
        print("syside not found — skipping validation.")
        return True

# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def main() -> None:
    _DVS_DIR = pathlib.Path(__file__).parent.parent
    DEFAULT_INPUT = _DVS_DIR / "data" / "DVS_Functional_Chains.xlsx"
    DEFAULT_OUTPUT = _DVS_DIR / "Functions_generated.sysml"

    args = sys.argv[1:]
    if args and args[0] in ("-h", "--help"):
        print(__doc__)
        sys.exit(0)

    input_path = pathlib.Path(args[0]) if args else DEFAULT_INPUT
    if not input_path.exists():
        print(f"Error: file not found: {input_path}", file=sys.stderr)
        sys.exit(1)

    output_path = pathlib.Path(args[1]) if len(args) >= 2 else DEFAULT_OUTPUT

    print(f"Reading:  {input_path}")
    chains = load_chains(input_path)

    if not chains:
        print("No functional chains found in the input file.", file=sys.stderr)
        sys.exit(1)

    print(f"Found:    {len(chains)} functional chains")

    if not output_path.exists():
        print(f"Error: SysML file not found: {output_path}", file=sys.stderr)
        sys.exit(1)

    sysml_text = output_path.read_text(encoding="utf-8")
    augmented = inject_chains(sysml_text, chains)

    output_path.write_text(augmented, encoding="utf-8")
    print(f"Written:  {output_path}")

    validate(output_path)

if __name__ == "__main__":
    main()
