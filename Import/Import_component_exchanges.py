#!/usr/bin/env python3
"""
import_component_exchanges_from_excel.py
Reads DVS_Component_Exchanges.xlsx and augments Parts_generated.sysml with:
  - port def ExchangeNameConnectionPoint  for each unique exchange
  - port usages inside each participating part def (matched by ID)
  - connection def ExchangeName           for each exchange

Exchange name convention: replace '-' with '_', remove spaces, collapse consecutive '_'.
Port usage name convention: PortName (no spaces) + '_' + first-4-chars-of-portID.

Modification:
  - Now handles part names with ID prefixes (first 4 chars)
  - Matches names like "EPS_cc31" in the parts file
  - Preserves existing import statements and perform action blocks
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
class Exchange:
    exchange_id: str
    exchange_name: str          # raw name from Excel
    exchange_kind: str
    from_part_id: str
    from_part_name: str
    from_port_id: str
    from_port_name: str
    from_port_direction: str
    to_part_id: str
    to_part_name: str
    to_port_id: str
    to_port_name: str
    to_port_direction: str

# ---------------------------------------------------------------------------
# Name helpers
# ---------------------------------------------------------------------------

def to_type_name(name: str, item_id: str = "") -> str:
    """Convert a component name to PascalCase SysML identifier.
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

    # Append first 4 characters of ID if available
    if item_id:
        id_prefix = item_id[:4]
        return f"{type_name}_{id_prefix}"
    return type_name

def to_usage_name(name: str, item_id: str = "") -> str:
    """Convert a component name to camelCase SysML usage identifier.
    Initial ALL-CAPS abbreviations are lowercased as a group.
    Appends first 4 characters of ID to ensure uniqueness.
    """
    type_name = to_type_name(name, item_id)
    if not type_name:
        return name

    # Find where the ID suffix starts (after the underscore)
    underscore_pos = type_name.find('_')
    if underscore_pos != -1:
        # Process only the name part before the underscore
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

def to_exchange_name(raw_name: str) -> str:
    """Convert a component exchange name to a SysML identifier.
    Replace '-' with '_', remove spaces, collapse consecutive '_'.

    Example: 'Ground station - Antenna - UHF' -> 'Groundstation_Antenna_UHF'
    """
    name = raw_name.replace("-", "_")
    name = name.replace(" ", "")
    name = re.sub(r"_+", "_", name)
    return name.strip("_")

def to_port_usage_name(port_name: str, port_id: str) -> str:
    """Build port usage name: stripped port name + '_' + first 4 chars of ID.

    Example: 'CP 1', '9b89a17d-...' -> 'CP1_9b89'
    """
    clean = port_name.replace(" ", "")
    return f"{clean}_{port_id[:4]}"

def extract_id_prefix_from_name(name: str) -> str:
    """
    Extract the ID prefix from a name that has an ID suffix.
    Returns the ID prefix if found, otherwise returns empty string.

    Examples:
      "EPS_cc31" -> "cc31"
      "ReceiveMissionStatus_1718" -> "1718"
      "LogicalSystem" -> ""
    """
    underscore_pos = name.rfind('_')
    if underscore_pos != -1 and len(name) > underscore_pos + 1:
        # Check if the part after underscore looks like an ID prefix (4 hex chars)
        suffix = name[underscore_pos+1:]
        if len(suffix) == 4 and all(c in '0123456789abcdef' for c in suffix.lower()):
            return suffix
    return ""

def get_part_id_to_name_map(content: str) -> Dict[str, str]:
    """
    Extract a mapping from part IDs to their type names from the SysML content.
    Returns a dictionary of {part_id: type_name}
    """
    part_id_to_name = {}

    # Find all part definitions
    part_def_pattern = r'part def (\w+)\s*\{([^}]*)\}'
    for match in re.finditer(part_def_pattern, content, re.DOTALL):
        type_name = match.group(1)
        part_content = match.group(2)

        # Extract ID from the part definition
        id_match = re.search(r'/\*\s*ID:\s*([0-9a-f-]+)\s*\*/', part_content)
        if id_match:
            part_id = id_match.group(1)
            part_id_to_name[part_id] = type_name

    return part_id_to_name

def match_part_name(part_name: str, part_id: str, id_to_name_map: Dict[str, str]) -> str:
    """
    Match a part name from Excel with the actual part name in the SysML file.
    Tries:
    1. Exact match
    2. Match by ID
    3. Match by base name (without ID prefix)
    """
    # First try exact match
    if part_name in id_to_name_map.values():
        return part_name

    # Try to match by ID
    if part_id in id_to_name_map:
        return id_to_name_map[part_id]

    # Try to match by base name (without ID prefix)
    base_name = part_name
    underscore_pos = part_name.rfind('_')
    if underscore_pos != -1:
        base_name = part_name[:underscore_pos]

    for type_name in id_to_name_map.values():
        type_base = type_name
        type_underscore_pos = type_name.rfind('_')
        if type_underscore_pos != -1:
            type_base = type_name[:type_underscore_pos]

        if type_base == base_name:
            return type_name

    # If all else fails, return the original name with ID prefix
    return to_type_name(part_name, part_id)

# ---------------------------------------------------------------------------
# Excel parsing
# ---------------------------------------------------------------------------

def load_exchanges(path: pathlib.Path) -> List[Exchange]:
    wb = openpyxl.load_workbook(path, data_only=True)
    ws = wb.active
    rows = list(ws.iter_rows(values_only=True))

    exchanges: List[Exchange] = []
    for row in rows[1:]:       # skip header row
        if not any(row):
            continue
        (from_id, from_name, from_port_id, from_port_name, from_port_dir, _from_port_kind,
         exch_id, exch_name, exch_kind,
         to_id, to_name, to_port_id, to_port_name, to_port_dir, _to_port_kind) = row[:15]

        if not exch_id:
            continue

        exchanges.append(Exchange(
            exchange_id=str(exch_id).strip(),
            exchange_name=str(exch_name).strip(),
            exchange_kind=str(exch_kind).strip() if exch_kind else "",
            from_part_id=str(from_id).strip(),
            from_part_name=str(from_name).strip(),
            from_port_id=str(from_port_id).strip(),
            from_port_name=str(from_port_name).strip(),
            from_port_direction=str(from_port_dir).strip() if from_port_dir else "",
            to_part_id=str(to_id).strip(),
            to_part_name=str(to_name).strip(),
            to_port_id=str(to_port_id).strip(),
            to_port_name=str(to_port_name).strip(),
            to_port_direction=str(to_port_dir).strip() if to_port_dir else "",
        ))

    return exchanges

# ---------------------------------------------------------------------------
# SysML injection
# ---------------------------------------------------------------------------

def _build_part_ports(exchanges: List[Exchange], part_id_to_name: Dict[str, str]) -> Dict[str, List[Tuple[str, str, str]]]:
    """Return mapping: part_name -> [(port_usage_name, port_def_name, port_id), ...]."""
    part_ports: Dict[str, List[Tuple[str, str, str]]] = {}

    for exch in exchanges:
        exch_name = to_exchange_name(exch.exchange_name)
        port_def_name = f"{exch_name}ConnectionPoint"

        # Match part names with actual names in the SysML file
        from_part_name = match_part_name(exch.from_part_name, exch.from_part_id, part_id_to_name)
        to_part_name = match_part_name(exch.to_part_name, exch.to_part_id, part_id_to_name)

        entries = [
            (from_part_name, exch.from_port_name, exch.from_port_id),
            (to_part_name,   exch.to_port_name,   exch.to_port_id),
        ]
        for part_name, port_name, port_id in entries:
            usage = to_port_usage_name(port_name, port_id)
            if part_name not in part_ports:
                part_ports[part_name] = []
            if not any(p[0] == usage for p in part_ports[part_name]):
                part_ports[part_name].append((usage, port_def_name, port_id))

    return part_ports

def _make_interface_def_lines(exch: "Exchange", part_id_to_name: Dict[str, str]) -> List[str]:
    """Package-level interface def for an exchange."""
    exch_name = to_exchange_name(exch.exchange_name)
    port_def_name = f"{exch_name}ConnectionPoint"
    iface_name = f"{exch_name}_Interface"

    # Match part names with actual names in the SysML file
    from_part_name = match_part_name(exch.from_part_name, exch.from_part_id, part_id_to_name)
    to_part_name = match_part_name(exch.to_part_name, exch.to_part_id, part_id_to_name)

    from_port_end = f"{to_usage_name(from_part_name)}Port"
    to_port_end = f"{to_usage_name(to_part_name)}Port"

    return [
        f"{INDENT}interface def {iface_name} {{",
        f"{INDENT * 2}end port {from_port_end} : {port_def_name};",
        f"{INDENT * 2}end port {to_port_end} : ~{port_def_name};",
        f"{INDENT}}}",
        "",
    ]

def _make_conn_def_lines(exch: "Exchange", part_id_to_name: Dict[str, str]) -> List[str]:
    """Package-level connection def for an exchange."""
    exch_name = to_exchange_name(exch.exchange_name)

    # Match part names with actual names in the SysML file
    from_part_name = match_part_name(exch.from_part_name, exch.from_part_id, part_id_to_name)
    to_part_name = match_part_name(exch.to_part_name, exch.to_part_id, part_id_to_name)

    from_port = to_port_usage_name(exch.from_port_name, exch.from_port_id)
    to_port = to_port_usage_name(exch.to_port_name, exch.to_port_id)
    from_end = to_usage_name(from_part_name)
    to_end = to_usage_name(to_part_name)

    return [
        f"{INDENT}connection def {exch_name} {{",
        f"{INDENT * 2}doc",
        f"{INDENT * 2}/* ID: {exch.exchange_id} */",
        f"{INDENT * 2}end part {from_end} : {from_part_name};",
        f"{INDENT * 2}end part {to_end} : {to_part_name};",
        f"{INDENT * 2}interface : {exch_name} connect {from_end}.{from_port} to {to_end}.{to_port};",
        f"{INDENT}}}",
        "",
    ]

def inject_exchanges(sysml_text: str, exchanges: List[Exchange]) -> str:
    """Return the SysML text augmented with port usages, port defs, interface defs, and connection defs."""
    # Get the mapping from part IDs to their type names
    part_id_to_name = get_part_id_to_name_map(sysml_text)

    part_ports = _build_part_ports(exchanges, part_id_to_name)

    existing_port_usages: Set[str] = set(re.findall(r"\bport\s+(\w+)\s*:", sysml_text))
    existing_port_defs: Set[str] = set(re.findall(r"\bport def\s+(\w+)", sysml_text))
    existing_iface_defs: Set[str] = set(re.findall(r"\binterface def\s+(\w+)", sysml_text))
    existing_conn_defs: Set[str] = set(re.findall(r"\bconnection def\s+(\w+)", sysml_text))

    # --- Inject port usages after matching ID comments ---
    lines = sysml_text.split("\n")
    result: List[str] = []

    for line in lines:
        result.append(line)
        id_match = re.search(r"/\* ID: ([0-9a-f-]+) \*/", line)
        if id_match:
            part_id = id_match.group(1)
            # Find the part name that matches this ID
            matched_part_name = None
            for pid, pname in part_id_to_name.items():
                if pid == part_id:
                    matched_part_name = pname
                    break

            if matched_part_name and matched_part_name in part_ports:
                base_indent = " " * (len(line) - len(line.lstrip()))
                for usage, port_def, p_id in part_ports[matched_part_name]:
                    if usage in existing_port_usages:
                        continue
                    existing_port_usages.add(usage)
                    result.append(f"{base_indent}port {usage} : {port_def} {{")
                    result.append(f"{base_indent}{INDENT}doc")
                    result.append(f"{base_indent}{INDENT}/* ID: {p_id} */")
                    result.append(f"{base_indent}}}")

    # --- Append port defs, interface defs, and connection defs at package level ---
    append_lines: List[str] = []

    for exch in exchanges:
        exch_name = to_exchange_name(exch.exchange_name)
        port_def_name = f"{exch_name}ConnectionPoint"
        if port_def_name not in existing_port_defs:
            existing_port_defs.add(port_def_name)
            append_lines.append(f"{INDENT}port def {port_def_name};")
            append_lines.append("")

    for exch in exchanges:
        iface_name = f"{to_exchange_name(exch.exchange_name)}_Interface"
        if iface_name not in existing_iface_defs:
            existing_iface_defs.add(iface_name)
            append_lines.extend(_make_interface_def_lines(exch, part_id_to_name))

    for exch in exchanges:
        exch_name = to_exchange_name(exch.exchange_name)
        if exch_name not in existing_conn_defs:
            existing_conn_defs.add(exch_name)
            append_lines.extend(_make_conn_def_lines(exch, part_id_to_name))

    # Insert before the last closing brace of the package
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
            ["syside", "check", str(sysml_path.parent)],
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
    DEFAULT_INPUT = _DVS_DIR / "data" / "DVS_Component_Exchanges.xlsx"
    DEFAULT_OUTPUT = _DVS_DIR / "Parts_generated.sysml"

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
    exchanges = load_exchanges(input_path)

    if not exchanges:
        print("No exchanges found in the input file.", file=sys.stderr)
        sys.exit(1)

    print(f"Found:    {len(exchanges)} component exchanges")

    if not output_path.exists():
        print(f"Error: SysML file not found: {output_path}", file=sys.stderr)
        sys.exit(1)

    sysml_text = output_path.read_text(encoding="utf-8")
    augmented = inject_exchanges(sysml_text, exchanges)

    output_path.write_text(augmented, encoding="utf-8")
    print(f"Written:  {output_path}")

    validate(output_path)

if __name__ == "__main__":
    main()