#!/usr/bin/env python3
"""
import_functional_exchanges_from_excel.py
Reads DVS_Logical_Functional_Exchanges.xlsx and augments Functions_generated.sysml with:
  - item def {ExchangeName}               for each unique exchange
  - port def {ExchangeName}FuncOut/FuncIn for each unique exchange
  - port usages injected into action defs (matched by ID)
  - connection def {FromName}To{ToName}Connection  for each exchange
  - interface def {FromName}To{ToName}Interface    for each exchange

Modification:
  - Now handles function names with ID prefixes (first 4 chars)
  - Matches names like "ReceiveMissionStatus_1718" in the functions file
"""

import pathlib
import re
import subprocess
import sys
from dataclasses import dataclass
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
class FunctionalExchange:
    from_action_id: str
    from_action_name: str
    from_port_id: str
    from_port_name: str
    exchange_id: str
    exchange_name: str
    to_action_id: str
    to_action_name: str
    to_port_id: str
    to_port_name: str

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

    # Append first 4 characters of ID if available
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

def to_port_usage_name(port_name: str, port_id: str) -> str:
    """Build a port usage name from the port's Excel name and ID.

    Strips spaces and appends the first 4 characters of the port ID,
    matching the convention used for component port usages:
      'FOP 1' + 'd957...' -> 'FOP1_d957'
    """
    clean = port_name.replace(" ", "")
    return f"{clean}_{port_id[:4]}"

def extract_id_prefix_from_name(name: str) -> str:
    """
    Extract the ID prefix from a name that has an ID suffix.
    Returns the ID prefix if found, otherwise returns empty string.

    Examples:
      "ReceiveMissionStatus_1718" -> "1718"
      "CODESelectCompanies_91c3" -> "91c3"
      "LogicalSystem" -> ""
    """
    underscore_pos = name.rfind('_')
    if underscore_pos != -1 and len(name) > underscore_pos + 1:
        # Check if the part after underscore looks like an ID prefix (4 hex chars)
        suffix = name[underscore_pos+1:]
        if len(suffix) == 4 and all(c in '0123456789abcdef' for c in suffix.lower()):
            return suffix
    return ""

def get_action_id_to_name_map(content: str) -> Dict[str, str]:
    """
    Extract a mapping from action IDs to their type names from the SysML content.
    Returns a dictionary of {action_id: type_name}
    """
    id_to_name = {}

    # Find all action definitions
    action_def_pattern = r'action def (\w+)\s*\{([^}]*)\}'
    for match in re.finditer(action_def_pattern, content, re.DOTALL):
        type_name = match.group(1)
        action_content = match.group(2)

        # Extract ID from the action definition
        id_match = re.search(r'/\*\s*ID:\s*([0-9a-f-]+)\s*\*/', action_content)
        if id_match:
            action_id = id_match.group(1)
            id_to_name[action_id] = type_name

    return id_to_name

def match_action_name(action_name: str, action_id: str, id_to_name_map: Dict[str, str]) -> str:
    """
    Match an action name from Excel with the actual action name in the SysML file.
    Tries:
    1. Exact match
    2. Match by ID
    3. Match by base name (without ID prefix)
    """
    # First try exact match
    if action_name in id_to_name_map.values():
        return action_name

    # Try to match by ID
    if action_id in id_to_name_map:
        return id_to_name_map[action_id]

    # Try to match by base name (without ID prefix)
    base_name = action_name
    underscore_pos = action_name.rfind('_')
    if underscore_pos != -1:
        base_name = action_name[:underscore_pos]

    for type_name in id_to_name_map.values():
        type_base = type_name
        type_underscore_pos = type_name.rfind('_')
        if type_underscore_pos != -1:
            type_base = type_name[:type_underscore_pos]

        if type_base == base_name:
            return type_name

    # If all else fails, return the original name with ID prefix
    return to_type_name(action_name, action_id)

# ---------------------------------------------------------------------------
# Excel parsing
# ---------------------------------------------------------------------------

def load_exchanges(path: pathlib.Path) -> List[FunctionalExchange]:
    wb = openpyxl.load_workbook(path, data_only=True)
    ws = wb.active
    rows = list(ws.iter_rows(values_only=True))

    exchanges: List[FunctionalExchange] = []
    for row in rows[1:]:       # skip header row
        if not any(row):
            continue
        (from_id, from_name, from_port_id, from_port_name,
         exch_id, exch_name,
         to_id, to_name, to_port_id, to_port_name) = row[:10]

        if not exch_id:
            continue

        exchanges.append(FunctionalExchange(
            from_action_id=str(from_id).strip(),
            from_action_name=str(from_name).strip(),
            from_port_id=str(from_port_id).strip(),
            from_port_name=str(from_port_name).strip(),
            exchange_id=str(exch_id).strip(),
            exchange_name=str(exch_name).strip(),
            to_action_id=str(to_id).strip(),
            to_action_name=str(to_name).strip(),
            to_port_id=str(to_port_id).strip(),
            to_port_name=str(to_port_name).strip(),
        ))

    return exchanges

# ---------------------------------------------------------------------------
# SysML file introspection
# ---------------------------------------------------------------------------

def parse_id_to_def_name(sysml_text: str) -> Dict[str, str]:
    """Parse the SysML text and return a mapping of ID -> def name.

    Handles names with ID prefixes like ReceiveMissionStatus_1718.
    """
    id_to_name: Dict[str, str] = {}
    for m in re.finditer(
        r"\baction def\s+(\w+)\s*\{[^{]*?/\* ID: ([0-9a-f-]+) \*/",
        sysml_text,
        re.DOTALL,
    ):
        id_to_name[m.group(2)] = m.group(1)
    return id_to_name

def parse_existing_def_names(sysml_text: str) -> Set[str]:
    """Return all defined names already present in the SysML text."""
    kinds = [
        r"\baction def\s+(\w+)",
        r"\bpart def\s+(\w+)",
        r"\bport def\s+(\w+)",
        r"\bitem def\s+(\w+)",
        r"\bconnection def\s+(\w+)",
        r"\binterface def\s+(\w+)",
        r"\battribute def\s+(\w+)",
    ]
    names: Set[str] = set()
    for pattern in kinds:
        for m in re.finditer(pattern, sysml_text):
            names.add(m.group(1))
    return names

def parse_non_item_def_names(sysml_text: str) -> Set[str]:
    """Return non-item def names (action, part, port, etc.) for conflict resolution.

    Excludes item defs so that item defs generated by a previous run of this
    script do not incorrectly trigger the 'Item' suffix on a re-run.
    """
    kinds = [
        r"\baction def\s+(\w+)",
        r"\bpart def\s+(\w+)",
        r"\bport def\s+(\w+)",
        r"\bconnection def\s+(\w+)",
        r"\binterface def\s+(\w+)",
        r"\battribute def\s+(\w+)",
    ]
    names: Set[str] = set()
    for pattern in kinds:
        for m in re.finditer(pattern, sysml_text):
            names.add(m.group(1))
    return names

# ---------------------------------------------------------------------------
# Item def name registry (with conflict resolution)
# ---------------------------------------------------------------------------

def build_item_name_registry(
    exchanges: List[FunctionalExchange],
    existing_names: Set[str],
) -> Dict[str, str]:
    """Return exchange_name -> safe_item_def_name, appending 'Item' on conflict.

    existing_names should contain only non-item def names so that item defs
    from a previous run of this script do not trigger a spurious suffix.
    """
    registry: Dict[str, str] = {}
    reserved = set(existing_names)

    for exch in exchanges:
        raw = to_type_name(exch.exchange_name)
        if raw in registry.values():
            continue
        name = raw
        if name in reserved:
            name = f"{raw}Item"
        registry[exch.exchange_name] = name
        reserved.add(name)

    return registry

# ---------------------------------------------------------------------------
# Unique name assignment for connection/interface defs
# ---------------------------------------------------------------------------

def _assign_conn_iface_names(
    exchanges: List[FunctionalExchange],
    id_to_def_name: Dict[str, str],
) -> List[Tuple[str, str]]:
    """Return (conn_name, iface_name) per exchange, with numeric suffixes on collisions."""
    seen: Dict[str, int] = {}
    result: List[Tuple[str, str]] = []

    # Get the action ID to name map
    action_id_to_name = get_action_id_to_name_map("")  # We'll populate this from id_to_def_name

    for exch in exchanges:
        # Match action names with actual names in the SysML file
        from_type = match_action_name(exch.from_action_name, exch.from_action_id, id_to_def_name)
        to_type = match_action_name(exch.to_action_name, exch.to_action_id, id_to_def_name)

        base = f"{from_type}To{to_type}"
        count = seen.get(base, 0) + 1
        seen[base] = count
        suffix = str(count) if count > 1 else ""
        result.append((f"{base}Connection{suffix}", f"{base}Interface{suffix}"))
    return result

# ---------------------------------------------------------------------------
# SysML generation helpers
# ---------------------------------------------------------------------------

def _item_type_name(exch: FunctionalExchange, registry: Dict[str, str]) -> str:
    return registry.get(exch.exchange_name, to_type_name(exch.exchange_name))

def _item_usage_name(exch: FunctionalExchange, registry: Dict[str, str]) -> str:
    return to_usage_name(_item_type_name(exch, registry))

def _funcout_def_name(exch: FunctionalExchange, registry: Dict[str, str]) -> str:
    return f"{_item_type_name(exch, registry)}FuncOut"

def _funcin_def_name(exch: FunctionalExchange, registry: Dict[str, str]) -> str:
    return f"{_item_type_name(exch, registry)}FuncIn"

def _funcout_usage_name(exch: FunctionalExchange) -> str:
    """Port usage name injected into the 'from' action (Excel port name + first 4 of ID)."""
    return to_port_usage_name(exch.from_port_name, exch.from_port_id)

def _funcin_usage_name(exch: FunctionalExchange) -> str:
    """Port usage name injected into the 'to' action (Excel port name + first 4 of ID)."""
    return to_port_usage_name(exch.to_port_name, exch.to_port_id)

def _make_item_def_lines(exch: FunctionalExchange, registry: Dict[str, str]) -> List[str]:
    return [
        f"{INDENT}item def {_item_type_name(exch, registry)} {{",
        f"{INDENT * 2}doc",
        f"{INDENT * 2}/* ID: {exch.exchange_id} */",
        f"{INDENT}}}",
        "",
    ]

def _make_port_def_lines(exch: FunctionalExchange, registry: Dict[str, str]) -> List[str]:
    item_type = _item_type_name(exch, registry)
    item_usage = _item_usage_name(exch, registry)
    return [
        f"{INDENT}port def {_funcout_def_name(exch, registry)} {{",
        f"{INDENT * 2}doc",
        f"{INDENT * 2}/* ID: {exch.from_port_id} */",
        f"{INDENT * 2}out item {item_usage} : {item_type};",
        f"{INDENT}}}",
        "",
        f"{INDENT}port def {_funcin_def_name(exch, registry)} {{",
        f"{INDENT * 2}doc",
        f"{INDENT * 2}/* ID: {exch.to_port_id} */",
        f"{INDENT * 2}in item {item_usage} : {item_type};",
        f"{INDENT}}}",
        "",
    ]

def _make_interface_def_lines(
    exch: FunctionalExchange,
    iface_name: str,
    registry: Dict[str, str],
) -> List[str]:
    item_type = _item_type_name(exch, registry)
    item_usage = _item_usage_name(exch, registry)
    return [
        f"{INDENT}interface def {iface_name} {{",
        f"{INDENT * 2}end port outPort : {_funcout_def_name(exch, registry)};",
        f"{INDENT * 2}end port inPort : {_funcin_def_name(exch, registry)};",
        f"{INDENT * 2}flow of {item_type} from outPort.{item_usage} to inPort.{item_usage};",
        f"{INDENT}}}",
        "",
    ]

def _make_connection_def_lines(
    exch: FunctionalExchange,
    conn_name: str,
    iface_name: str,
    registry: Dict[str, str],
    id_to_def_name: Dict[str, str],
) -> List[str]:
    # Match action names with actual names in the SysML file
    from_type = match_action_name(exch.from_action_name, exch.from_action_id, id_to_def_name)
    to_type = match_action_name(exch.to_action_name, exch.to_action_id, id_to_def_name)

    item_usage = _item_usage_name(exch, registry)
    from_end = f"{item_usage}Out"
    to_end = f"{item_usage}In"
    return [
        f"{INDENT}connection def {conn_name} {{",
        f"{INDENT * 2}doc",
        f"{INDENT * 2}/* ID: {exch.exchange_id} */",
        f"{INDENT * 2}end action {from_end} : {from_type};",
        f"{INDENT * 2}end action {to_end} : {to_type};",
        f"{INDENT * 2}interface : {iface_name}"
        f" connect {to_end}.{_funcin_usage_name(exch)}"
        f" to {from_end}.{_funcout_usage_name(exch)};",
        f"{INDENT}}}",
        "",
    ]

# ---------------------------------------------------------------------------
# SysML injection
# ---------------------------------------------------------------------------

def _build_action_ports(
    exchanges: List[FunctionalExchange],
    registry: Dict[str, str],
    id_to_def_name: Dict[str, str],
) -> Dict[str, List[Tuple[str, str, str]]]:
    """Return mapping: action_id -> [(port_usage_name, port_def_name, port_id), ...]."""
    action_ports: Dict[str, List[Tuple[str, str, str]]] = {}

    for exch in exchanges:
        # Match action names with actual names in the SysML file
        from_action_name = match_action_name(exch.from_action_name, exch.from_action_id, id_to_def_name)
        to_action_name = match_action_name(exch.to_action_name, exch.to_action_id, id_to_def_name)

        entries = [
            (exch.from_action_id, _funcout_usage_name(exch), _funcout_def_name(exch, registry), exch.from_port_id),
            (exch.to_action_id, _funcin_usage_name(exch), _funcin_def_name(exch, registry), exch.to_port_id),
        ]
        for action_id, usage, def_name, port_id in entries:
            # Use the matched action name for the key
            matched_action_id = None
            for pid, pname in id_to_def_name.items():
                if pname == from_action_name and pid == action_id:
                    matched_action_id = action_id
                    break
                if pname == to_action_name and pid == action_id:
                    matched_action_id = action_id
                    break

            if matched_action_id:
                if matched_action_id not in action_ports:
                    action_ports[matched_action_id] = []
                if not any(p[0] == usage for p in action_ports[matched_action_id]):
                    action_ports[matched_action_id].append((usage, def_name, port_id))

    return action_ports

def _scan_existing_action_ports(sysml_text: str) -> Set[Tuple[str, str]]:
    """Return (action_id, port_usage_name) pairs already present in the SysML text.

    Uses brace-depth tracking so that ID comments inside injected port bodies
    (depth > action body depth) do not override the current action's ID.
    """
    pairs: Set[Tuple[str, str]] = set()
    current_id: Optional[str] = None
    action_body_depth: Optional[int] = None
    depth = 0

    action_def_re = re.compile(r"\baction def\s+\w+")

    for line in sysml_text.splitlines():
        # Detect action def BEFORE updating depth; body is one deeper than here.
        if action_def_re.search(line):
            action_body_depth = depth + 1
            current_id = None

        # Check ID comments and port usages at PRE-UPDATE depth so that a port
        # line ending with '{' doesn't falsely bump us out of the action body.
        id_m = re.search(r"/\* ID: ([0-9a-f-]+) \*/", line)
        if id_m and action_body_depth is not None and depth == action_body_depth:
            current_id = id_m.group(1)

        port_m = re.search(r"\bport\s+(\w+)\s*:", line)
        if port_m and current_id and action_body_depth is not None and depth == action_body_depth:
            pairs.add((current_id, port_m.group(1)))

        # Update depth AFTER the checks above.
        depth += line.count("{") - line.count("}")

        # Reset when we leave the action body.
        if action_body_depth is not None and depth < action_body_depth:
            current_id = None
            action_body_depth = None

    return pairs

def inject_exchanges(sysml_text: str, exchanges: List[FunctionalExchange]) -> str:
    """Return the SysML text augmented with port usages, item/port/interface/connection defs."""
    id_to_def_name = parse_id_to_def_name(sysml_text)
    non_item_names = parse_non_item_def_names(sysml_text)
    registry = build_item_name_registry(exchanges, non_item_names)
    action_ports = _build_action_ports(exchanges, registry, id_to_def_name)
    conn_iface_names = _assign_conn_iface_names(exchanges, id_to_def_name)

    # Track (action_id, usage_name) pairs — the same usage name is valid in
    # different action defs, so a global usage-name set would incorrectly block
    # the second injection of a name that legitimately appears in two actions.
    injected_pairs: Set[Tuple[str, str]] = _scan_existing_action_ports(sysml_text)
    existing_item_defs: Set[str] = set(re.findall(r"\bitem def\s+(\w+)", sysml_text))
    existing_port_defs: Set[str] = set(re.findall(r"\bport def\s+(\w+)", sysml_text))
    existing_iface_defs: Set[str] = set(re.findall(r"\binterface def\s+(\w+)", sysml_text))
    existing_conn_defs: Set[str] = set(re.findall(r"\bconnection def\s+(\w+)", sysml_text))

    # --- Inject port usages after matching action ID comments ---
    lines = sysml_text.split("\n")
    result: List[str] = []

    for line in lines:
        result.append(line)
        id_match = re.search(r"/\* ID: ([0-9a-f-]+) \*/", line)
        if id_match:
            action_id = id_match.group(1)
            if action_id in action_ports:
                base_indent = " " * (len(line) - len(line.lstrip()))
                for usage, def_name, port_id in action_ports[action_id]:
                    if (action_id, usage) in injected_pairs:
                        continue
                    injected_pairs.add((action_id, usage))
                    result.append(f"{base_indent}port {usage} : {def_name} {{")
                    result.append(f"{base_indent}{INDENT}doc")
                    result.append(f"{base_indent}{INDENT}/* ID: {port_id} */")
                    result.append(f"{base_indent}}}")

    # --- Append item defs, port defs, interface defs, connection defs at package level ---
    append_lines: List[str] = []

    for exch in exchanges:
        item_name = _item_type_name(exch, registry)
        if item_name not in existing_item_defs:
            existing_item_defs.add(item_name)
            append_lines.extend(_make_item_def_lines(exch, registry))

    for exch in exchanges:
        funcout = _funcout_def_name(exch, registry)
        funcin = _funcin_def_name(exch, registry)
        if funcout not in existing_port_defs:
            existing_port_defs.add(funcout)
            existing_port_defs.add(funcin)
            append_lines.extend(_make_port_def_lines(exch, registry))

    for exch, (conn_name, iface_name) in zip(exchanges, conn_iface_names):
        if iface_name not in existing_iface_defs:
            existing_iface_defs.add(iface_name)
            append_lines.extend(_make_interface_def_lines(exch, iface_name, registry))

    for exch, (conn_name, iface_name) in zip(exchanges, conn_iface_names):
        if conn_name not in existing_conn_defs:
            existing_conn_defs.add(conn_name)
            append_lines.extend(_make_connection_def_lines(exch, conn_name, iface_name, registry, id_to_def_name))

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
    DEFAULT_INPUT = _DVS_DIR / "data" / "DVS_Logical_Functional_Exchanges.xlsx"
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
    exchanges = load_exchanges(input_path)

    if not exchanges:
        print("No exchanges found in the input file.", file=sys.stderr)
        sys.exit(1)

    print(f"Found:    {len(exchanges)} functional exchanges")

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