#!/usr/bin/env python3
"""
import_allocations_from_excel.py

Reads function-system allocation data from an Excel or CSV file and injects
'perform action' statements into the existing Parts_generated.sysml file.
Also adds 'private import FunctionsGenerated::*;' to the package header.

Expected column layout (any number of hierarchy levels):
  System ID | System Name | SubSystem ID | SubSystem Name | ... |
  Function ID | Function Name | SubFunction ID | SubFunction Name | ...

Columns are classified as "system" or "function" by checking whether "function"
appears in the column header — so any depth of Sub...System and Sub...Function
columns is handled automatically.

Usage:
  python import_allocations_from_excel.py [input.xlsx] [parts.sysml] [functions.sysml] [functions_pkg]

Defaults:
  input    : DVS/data/DVS_Function_System_Links.xlsx
  parts    : DVS/Parts_generated.sysml
  functions: DVS/Functions_generated.sysml
  functions_pkg: FunctionsGenerated

Modification:
  - Now handles part and function names with ID prefixes (first 4 chars)
  - Matches names like "EPS_cc31" and "StoreEnergyInTheBatteries_baf4"
  - Reads functions file to get correct function names with ID prefixes
"""

import csv
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

INDENT = "    "  # 4 spaces

@dataclass
class Allocation:
    target_system_path: List[str]  # e.g. ["Logical System", "EPS"]
    target_system_id: str
    function_name: str
    function_id: str

# ---------------------------------------------------------------------------
# Name conversion helpers
# ---------------------------------------------------------------------------

def to_type_name(name: str, item_id: str = "") -> str:
    """
    Convert a name to PascalCase SysML type identifier. ALL-CAPS abbreviations are kept.
    Appends first 4 characters of ID to ensure uniqueness.

    Examples:
      "Logical System" with ID "e9b6..." -> "LogicalSystem_e9b6"
      "EPS" with ID "cc31..." -> "EPS_cc31"
      "Store Energy In The Batteries" with ID "baf4..." -> "StoreEnergyInTheBatteries_baf4"
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
    """
    Convert a name to camelCase SysML usage identifier.
    Initial ALL-CAPS abbreviations are lowercased as a group.
    Appends first 4 characters of ID to ensure uniqueness.

    Examples:
      "Logical System" with ID "e9b6..." -> "logicalSystem_e9b6"
      "EPS" with ID "cc31..." -> "eps_cc31"
      "Store Energy In The Batteries" with ID "baf4..." -> "storeEnergyInTheBatteries_baf4"
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

def extract_id_prefix_from_name(name: str) -> str:
    """
    Extract the ID prefix from a name that has an ID suffix.
    Returns the ID prefix if found, otherwise returns empty string.

    Examples:
      "EPS_cc31" -> "cc31"
      "StoreEnergyInTheBatteries_baf4" -> "baf4"
      "LogicalSystem" -> ""
    """
    underscore_pos = name.rfind('_')
    if underscore_pos != -1 and len(name) > underscore_pos + 1:
        # Check if the part after underscore looks like an ID prefix (4 hex chars)
        suffix = name[underscore_pos+1:]
        if len(suffix) == 4 and all(c in '0123456789abcdef' for c in suffix.lower()):
            return suffix
    return ""

def get_all_part_defs(content: str) -> Dict[str, str]:
    """
    Extract all part definitions from the SysML content.
    Returns a dictionary of {type_name: full_definition}
    """
    part_defs = {}
    pattern = r'part def (\w+)\s*\{([^}]*)\}'
    for match in re.finditer(pattern, content, re.DOTALL):
        type_name = match.group(1)
        part_defs[type_name] = match.group(0)
    return part_defs

def get_function_id_to_name_map(content: str) -> Dict[str, str]:
    """
    Extract a mapping from function IDs to their type names from the SysML content.
    Returns a dictionary of {function_id: type_name}
    """
    function_id_to_name = {}

    # Find all action definitions
    action_def_pattern = r'action def (\w+)\s*\{([^}]*)\}'
    for match in re.finditer(action_def_pattern, content, re.DOTALL):
        type_name = match.group(1)
        action_content = match.group(2)

        # Extract ID from the action definition
        id_match = re.search(r'/\*\s*ID:\s*([0-9a-f-]+)\s*\*/', action_content)
        if id_match:
            function_id = id_match.group(1)
            function_id_to_name[function_id] = type_name

    return function_id_to_name

def find_best_part_match(target_name: str, part_defs: Dict[str, str], target_id: str = "") -> Optional[str]:
    """
    Find the best matching part definition for a target name.
    Tries:
    1. Exact match (with ID prefix)
    2. Match without ID prefix
    3. Match by ID prefix only
    """
    # First try exact match
    if target_name in part_defs:
        return target_name

    # Try without ID prefix
    base_name = target_name
    underscore_pos = target_name.rfind('_')
    if underscore_pos != -1:
        base_name = target_name[:underscore_pos]
        if base_name in part_defs:
            return base_name

    # Try to match by ID prefix
    if target_id:
        id_prefix = target_id[:4]
        for part_name in part_defs:
            part_id_prefix = extract_id_prefix_from_name(part_name)
            if part_id_prefix == id_prefix:
                return part_name

    # Try to find any part that starts with the base name
    for part_name in part_defs:
        if part_name.startswith(base_name + "_"):
            return part_name
        if part_name.startswith(base_name):
            return part_name

    return None

def find_best_function_match(target_name: str, target_id: str, function_id_to_name: Dict[str, str]) -> str:
    """
    Find the best matching function name for a target function.
    Tries:
    1. Exact match (with ID prefix)
    2. Match by ID
    3. Match by base name (without ID prefix)
    """
    # First try exact match
    if target_name in function_id_to_name.values():
        return target_name

    # Try to match by ID
    if target_id in function_id_to_name:
        return function_id_to_name[target_id]

    # Try to match by base name (without ID prefix)
    base_name = target_name
    underscore_pos = target_name.rfind('_')
    if underscore_pos != -1:
        base_name = target_name[:underscore_pos]

    for type_name in function_id_to_name.values():
        type_base = type_name
        type_underscore_pos = type_name.rfind('_')
        if type_underscore_pos != -1:
            type_base = type_name[:type_underscore_pos]

        if type_base == base_name:
            return type_name

    # If all else fails, return the original name with ID prefix
    return to_type_name(target_name, target_id)

# ---------------------------------------------------------------------------
# Excel / CSV parsing
# ---------------------------------------------------------------------------

def _detect_columns(
    header: Tuple,
) -> Tuple[List[Tuple[int, int]], List[Tuple[int, int]]]:
    """
    Scan the header row and return (system_pairs, function_pairs).
    Each pair is (id_col_index, name_col_index).
    A pair is classified as "function" if "function" appears in either header cell,
    otherwise it is a "system" pair.
    """
    h = [str(c).lower().strip() if c else "" for c in header]
    system_pairs: List[Tuple[int, int]] = []
    function_pairs: List[Tuple[int, int]] = []

    for id_col, id_header in enumerate(h):
        if "id" not in id_header or not id_header:
            continue
        for name_col in range(id_col + 1, len(h)):
            if "name" in h[name_col]:
                is_function = "function" in id_header or "function" in h[name_col]
                (function_pairs if is_function else system_pairs).append((id_col, name_col))
                break

    return system_pairs, function_pairs

def _parse_allocation_rows(rows: List[Tuple]) -> List[Allocation]:
    if not rows:
        return []

    header = rows[0]
    system_pairs, function_pairs = _detect_columns(header)

    if not system_pairs:
        print("Warning: no system ID/Name column pairs found in header.", file=sys.stderr)
        print(f"  Header: {header}", file=sys.stderr)
        return []
    if not function_pairs:
        print("Warning: no function ID/Name column pairs found in header.", file=sys.stderr)
        print(f"  Header: {header}", file=sys.stderr)
        return []

    allocations: List[Allocation] = []
    current_system_path: List[str] = []
    current_system_id: str = ""

    for row in rows[1:]:
        row = list(row) + [None] * max(len(header), 20)

        # Update current system context: use the first non-empty system level found
        for level, (id_col, name_col) in enumerate(system_pairs):
            cell_id = row[id_col]
            cell_name = row[name_col]
            if cell_id and cell_name:
                current_system_path = current_system_path[:level]
                current_system_path.append(str(cell_name).strip())
                current_system_id = str(cell_id).strip()
                break

        # Use the deepest non-empty function column as the allocated function
        function_name = ""
        function_id = ""
        for id_col, name_col in reversed(function_pairs):
            val = row[name_col]
            if val and str(val).strip():
                function_name = str(val).strip()
                function_id = str(row[id_col]).strip() if row[id_col] else ""
                break

        if function_name:
            if current_system_path:
                allocations.append(Allocation(
                    target_system_path=current_system_path.copy(),
                    target_system_id=current_system_id,
                    function_name=function_name,
                    function_id=function_id,
                ))
            else:
                print(f"Warning: function '{function_name}' has no target system.", file=sys.stderr)

    return allocations

def read_excel(path: pathlib.Path) -> List[Allocation]:
    wb = openpyxl.load_workbook(path, data_only=True)
    ws = wb.active
    return _parse_allocation_rows(list(ws.iter_rows(values_only=True)))

def read_csv(path: pathlib.Path) -> List[Allocation]:
    sample = path.read_text(encoding="utf-8-sig")[:2048]
    delimiter = ";" if sample.count(";") > sample.count(",") else ","
    with path.open(encoding="utf-8-sig") as f:
        rows = [tuple(row) for row in csv.reader(f, delimiter=delimiter)]
    return _parse_allocation_rows(rows)

def load_allocations(path: pathlib.Path) -> List[Allocation]:
    suffix = path.suffix.lower()
    if suffix in (".xlsx", ".xlsm", ".xls"):
        return read_excel(path)
    if suffix in (".csv", ".tsv"):
        return read_csv(path)
    try:
        return read_excel(path)
    except Exception:
        return read_csv(path)

# ---------------------------------------------------------------------------
# SysML file manipulation
# ---------------------------------------------------------------------------

def _find_block_end(content: str, brace_pos: int) -> int:
    """Return the index of the '}' that closes the '{' at brace_pos."""
    depth = 0
    for i in range(brace_pos, len(content)):
        if content[i] == '{':
            depth += 1
        elif content[i] == '}':
            depth -= 1
            if depth == 0:
                return i
    return -1

def _strip_perform_actions(content: str) -> str:
    """
    Remove all 'perform action ...' blocks from content.
    Handles multi-line blocks via brace depth tracking.
    Operates line-by-line for simplicity and robustness.
    """
    lines = content.split('\n')
    result: List[str] = []
    skipping = False
    depth = 0

    for line in lines:
        if not skipping:
            if re.match(r'^\s+perform\s+action\b', line):
                skipping = True
                depth = line.count('{') - line.count('}')
                if depth <= 0:
                    skipping = False  # single-line / no-body form
                # Either way, do not append this line
            else:
                result.append(line)
        else:
            depth += line.count('{') - line.count('}')
            if depth <= 0:
                skipping = False  # closing brace line — skip it too

    return '\n'.join(result)

def _ensure_import(content: str, functions_package: str) -> str:
    """Insert 'private import <pkg>::*;' after the package opening brace if absent."""
    import_stmt = f"private import {functions_package}::*;"
    if import_stmt in content:
        return content
    m = re.search(r'\bpackage\s+\w[\w.]*\s*\{', content)
    if not m:
        return content
    return content[:m.end()] + f"\n\n{INDENT}{import_stmt}" + content[m.end():]

def _build_perform_block(action_name: str, action_type: str, function_id: str) -> str:
    """Return a formatted 'perform action' block at part-def body indentation (2 levels)."""
    i1 = INDENT * 2
    i2 = INDENT * 3
    return "\n".join([
        f"{i1}perform action {action_name} : {action_type} {{",
        f"{i2}doc",
        f"{i2}/* ID: {function_id} */",
        f"{i1}}}",
    ])

def _insert_into_part_def(content: str, type_name: str, perform_blocks: List[str], part_defs: Dict[str, str]) -> str:
    """
    Find 'part def TYPE_NAME { ... }' and insert perform_blocks before its closing '}'.
    Uses the part_defs dictionary to find the best match.
    """
    # Find the best matching part definition
    matched_name = find_best_part_match(type_name, part_defs)
    if not matched_name:
        print(f"Warning: 'part def {type_name}' not found in parts file; allocation skipped.", file=sys.stderr)
        return content

    # Find the position of the matched part def
    pattern = rf'part def {re.escape(matched_name)}\s*\{{'
    m = re.search(pattern, content)
    if not m:
        print(f"Warning: 'part def {matched_name}' not found in parts file; allocation skipped.", file=sys.stderr)
        return content

    brace_pos = m.end() - 1  # position of the opening '{'
    end_pos = _find_block_end(content, brace_pos)
    if end_pos == -1:
        print(f"Warning: unmatched '{{' for 'part def {matched_name}'.", file=sys.stderr)
        return content

    # Insert before the line that holds the closing '}' to preserve its indentation
    line_start = content.rfind('\n', 0, end_pos) + 1
    insert_text = "\n".join(perform_blocks) + "\n"
    return content[:line_start] + insert_text + content[line_start:]

def merge_allocations_into_parts(
    parts_content: str,
    allocations: List[Allocation],
    functions_content: str,
    functions_package: str = "FunctionsGenerated",
) -> str:
    """
    Inject perform action statements from allocations into the parts SysML content.

    Steps:
      1. Strip any previously injected perform action blocks (idempotency).
      2. Ensure the functions package import is present.
      3. Get function ID to name mapping from functions content
      4. Group allocations by the type name of their deepest system.
      5. Insert perform action blocks into each matching part def with correct function names.
    """
    content = _strip_perform_actions(parts_content)
    content = _ensure_import(content, functions_package)

    # Get all part definitions from the content
    part_defs = get_all_part_defs(content)

    # Get function ID to name mapping
    function_id_to_name = get_function_id_to_name_map(functions_content)

    # Group by the SysML type name of the innermost system element
    by_type: Dict[str, List[Allocation]] = {}
    for alloc in allocations:
        # The target system path might already include ID prefixes
        last_system_name = alloc.target_system_path[-1]
        # Create the type name with ID prefix
        type_name = to_type_name(last_system_name, alloc.target_system_id)
        by_type.setdefault(type_name, []).append(alloc)

    for type_name, allocs in by_type.items():
        perform_blocks = []
        for a in allocs:
            # Find the correct function name with ID prefix
            matched_function_name = find_best_function_match(a.function_name, a.function_id, function_id_to_name)
            perform_blocks.append(
                _build_perform_block(
                    to_usage_name(a.function_name, a.function_id),
                    matched_function_name,
                    a.function_id,
                )
            )
        content = _insert_into_part_def(content, type_name, perform_blocks, part_defs)

    return content

# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def main() -> None:
    _DVS_DIR = pathlib.Path(__file__).parent.parent
    DEFAULT_INPUT = _DVS_DIR / "data" / "DVS_Function_System_Links.xlsx"
    DEFAULT_PARTS = _DVS_DIR / "Parts_generated.sysml"
    DEFAULT_FUNCTIONS = _DVS_DIR / "Functions_generated.sysml"
    DEFAULT_FUNCTIONS_PKG = "FunctionsGenerated"

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

    functions_path = pathlib.Path(args[2]) if len(args) >= 3 else DEFAULT_FUNCTIONS
    if not functions_path.exists():
        print(f"Error: functions file not found: {functions_path}", file=sys.stderr)
        sys.exit(1)

    functions_pkg = args[3] if len(args) >= 4 else DEFAULT_FUNCTIONS_PKG

    print(f"Reading allocations : {input_path}")
    allocations = load_allocations(input_path)
    if not allocations:
        print("No allocations found. Check the column layout.", file=sys.stderr)
        sys.exit(1)
    print(f"Found               : {len(allocations)} allocations")

    print(f"Reading parts file  : {parts_path}")
    parts_content = parts_path.read_text(encoding="utf-8")

    print(f"Reading functions file: {functions_path}")
    functions_content = functions_path.read_text(encoding="utf-8")

    print("Merging allocations into parts...")
    updated = merge_allocations_into_parts(parts_content, allocations, functions_content, functions_pkg)

    parts_path.write_text(updated, encoding="utf-8")
    print(f"Written             : {parts_path}")

    # Validate with all files in the same directory so cross-file imports resolve
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