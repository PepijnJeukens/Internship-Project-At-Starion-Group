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
  python import_allocations_from_excel.py [input.xlsx] [parts.sysml] [functions_pkg]

Defaults:
  input    : DVS/data/DVS_Function_System_Links.xlsx
  parts    : DVS/Parts_generated.sysml
  functions: FunctionsGenerated
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

def to_type_name(name: str) -> str:
    """Convert a name to PascalCase SysML type identifier. ALL-CAPS abbreviations are kept."""
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
    """Convert a name to camelCase SysML usage identifier."""
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


def _insert_into_part_def(content: str, type_name: str, perform_blocks: List[str]) -> str:
    """
    Find 'part def TYPE_NAME { ... }' and insert perform_blocks before its closing '}'.
    If the type is not found, a warning is printed and content is returned unchanged.
    """
    pattern = rf'\bpart\s+def\s+{re.escape(type_name)}\s*\{{'
    m = re.search(pattern, content)
    if not m:
        print(
            f"Warning: 'part def {type_name}' not found in parts file; allocation skipped.",
            file=sys.stderr,
        )
        return content

    brace_pos = m.end() - 1  # position of the opening '{'
    end_pos = _find_block_end(content, brace_pos)
    if end_pos == -1:
        print(f"Warning: unmatched '{{' for 'part def {type_name}'.", file=sys.stderr)
        return content

    # Insert before the line that holds the closing '}' to preserve its indentation
    line_start = content.rfind('\n', 0, end_pos) + 1
    insert_text = "\n".join(perform_blocks) + "\n"
    return content[:line_start] + insert_text + content[line_start:]


def merge_allocations_into_parts(
    parts_content: str,
    allocations: List[Allocation],
    functions_package: str = "FunctionsGenerated",
) -> str:
    """
    Inject perform action statements from allocations into the parts SysML content.

    Steps:
      1. Strip any previously injected perform action blocks (idempotency).
      2. Ensure the functions package import is present.
      3. Group allocations by the type name of their deepest system.
      4. Insert perform action blocks into each matching part def.
    """
    content = _strip_perform_actions(parts_content)
    content = _ensure_import(content, functions_package)

    # Group by the SysML type name of the innermost system element
    by_type: Dict[str, List[Allocation]] = {}
    for alloc in allocations:
        type_name = to_type_name(alloc.target_system_path[-1])
        by_type.setdefault(type_name, []).append(alloc)

    for type_name, allocs in by_type.items():
        perform_blocks = [
            _build_perform_block(
                to_usage_name(a.function_name),
                to_type_name(a.function_name),
                a.function_id,
            )
            for a in allocs
        ]
        content = _insert_into_part_def(content, type_name, perform_blocks)

    return content


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def main() -> None:
    _DVS_DIR = pathlib.Path(__file__).parent.parent
    DEFAULT_INPUT = _DVS_DIR / "data" / "DVS_Function_System_Links.xlsx"
    DEFAULT_PARTS = _DVS_DIR / "Parts_generated.sysml"
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

    functions_pkg = args[2] if len(args) >= 3 else DEFAULT_FUNCTIONS_PKG

    print(f"Reading allocations : {input_path}")
    allocations = load_allocations(input_path)
    if not allocations:
        print("No allocations found. Check the column layout.", file=sys.stderr)
        sys.exit(1)
    print(f"Found               : {len(allocations)} allocations")

    print(f"Reading parts file  : {parts_path}")
    parts_content = parts_path.read_text(encoding="utf-8")

    print("Merging allocations into parts...")
    updated = merge_allocations_into_parts(parts_content, allocations, functions_pkg)

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
