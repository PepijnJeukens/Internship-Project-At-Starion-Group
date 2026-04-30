#!/usr/bin/env python3
"""
export_allocations_to_excel.py
Exports function allocations from a SysML v2 Allocations file to an Excel file.
Properly handles system hierarchy levels (System, SubSystem, SubSubSystem, etc.).
"""

import pathlib
import re
import sys
from typing import Dict

import openpyxl
from openpyxl.styles import PatternFill

try:
    import openpyxl
except ImportError:
    print("Error: openpyxl is required. Install it with: pip install openpyxl", file=sys.stderr)
    sys.exit(1)

# ---------------------------------------------------------------------------
# Helper functions
# ---------------------------------------------------------------------------

def from_pascal_case(name: str) -> str:
    """
    Convert PascalCase to space-separated words with proper handling of acronyms.
    """
    if not name:
        return name

    if name.isupper():
        return name

    result = []
    i = 0
    n = len(name)

    while i < n:
        if name[i].isupper():
            j = i
            while j < n and name[j].isupper():
                j += 1

            if j == n:
                result.append(name[i:j])
                i = j
            elif j < n and name[j].islower():
                result.append(name[i:j-1])
                result.append(" " + name[j-1])
                i = j
            else:
                result.append(name[i:j])
                i = j
        else:
            result.append(name[i])
            i += 1

    return "".join(result).replace("  ", " ").strip()

def get_id_from_doc(text: str) -> str:
    """Extract ID from documentation comment text."""
    match = re.search(r"ID:\s*([^\s]+)", text)
    return match.group(1) if match else ""

def parse_allocations_file(file_path: pathlib.Path) -> Dict:
    """
    Parse the Allocations_generated.sysml file to extract system hierarchy and function allocations.
    Returns a nested dictionary representing the hierarchy.
    """
    root = {}
    current_path = []
    current_system = None
    indent_stack = [0]

    with open(file_path, 'r', encoding='utf-8') as f:
        for line in f:
            line = line.rstrip()
            if not line.strip():
                continue

            indent = len(line) - len(line.lstrip())
            indent_level = indent // 4

            while len(current_path) > indent_level:
                current_path.pop()

            part_def_match = re.match(r'\s*part def (\w+)\s*{', line)
            if part_def_match:
                system_name = part_def_match.group(1)
                current_path.append(system_name)

                current_dict = root
                for part in current_path[:-1]:
                    if part not in current_dict['children']:
                        current_dict['children'][part] = {'children': {}, 'functions': []}
                    current_dict = current_dict['children'][part]

                current_system = current_dict['children'][system_name] = {
                    'name': system_name,
                    'id': None,
                    'children': {},
                    'functions': []
                }
                continue

            doc_match = re.match(r'\s*/\*\s*ID:\s*([^\s]+)\s*\*/', line)
            if doc_match and current_system:
                current_system['id'] = doc_match.group(1)
                continue

            perform_match = re.match(r'\s*perform action \w+ : (\w+);', line)
            if perform_match and current_system:
                function_name = perform_match.group(1)
                current_system['functions'].append((function_name, None))

    return root

def get_function_ids(functions_file: pathlib.Path) -> Dict[str, str]:
    """Extract function names and their IDs from Functions_generated.sysml."""
    function_ids = {}
    current_function = None

    with open(functions_file, 'r', encoding='utf-8') as f:
        for line in f:
            line = line.strip()

            action_def_match = re.match(r'action def (\w+)\s*{', line)
            if action_def_match:
                current_function = action_def_match.group(1)
                continue

            doc_match = re.match(r'\s*/\*\s*ID:\s*([^\s]+)\s*\*/', line)
            if doc_match and current_function:
                function_ids[current_function] = doc_match.group(1)
                current_function = None

    return function_ids

def get_system_ids(parts_file: pathlib.Path) -> Dict[str, str]:
    """Extract system names and their IDs from Parts_generated.sysml."""
    system_ids = {}
    current_system = None

    with open(parts_file, 'r', encoding='utf-8') as f:
        for line in f:
            line = line.strip()

            part_def_match = re.match(r'part def (\w+)\s*{', line)
            if part_def_match:
                current_system = part_def_match.group(1)
                continue

            doc_match = re.match(r'\s*/\*\s*ID:\s*([^\s]+)\s*\*/', line)
            if doc_match and current_system:
                system_ids[current_system] = doc_match.group(1)
                current_system = None

    return system_ids

# ---------------------------------------------------------------------------
# Excel export functions
# ---------------------------------------------------------------------------

def create_workbook() -> openpyxl.Workbook:
    """Create a new workbook with headers."""
    wb = openpyxl.Workbook()

    if wb.active.title == "Sheet":
        wb.remove(wb.active)

    ws = wb.create_sheet("Allocations")

    headers = [
        "System ID", "System Name",
        "SubSystem ID", "SubSystem Name",
        "SubSubSystem ID", "SubSubSystem Name",
        "SubSubSubSystem ID", "SubSubSubSystem Name",
        "Function ID", "Function Name"
    ]

    for col, header in enumerate(headers, 1):
        ws.cell(row=1, column=col, value=header)

    for cell in ws[1]:
        cell.fill = PatternFill(start_color="D3D3D3", end_color="D3D3D3", fill_type="solid")

    return wb

def add_to_sheet(ws, data, level, system_ids, function_ids):
    """
    Recursively add systems and their functions to the worksheet.
    """
    system_id_col = 1 + (level * 2)
    system_name_col = 2 + (level * 2)
    function_id_col = 9
    function_name_col = 10

    new_row = ws.max_row + 1
    system_id = system_ids.get(data['name'], "")
    display_name = from_pascal_case(data['name'])

    ws.cell(row=new_row, column=system_id_col, value=system_id)
    ws.cell(row=new_row, column=system_name_col, value=display_name)

    for function_name, _ in data['functions']:
        function_row = ws.max_row + 1
        function_id = function_ids.get(function_name, "")
        function_display_name = from_pascal_case(function_name)

        ws.cell(row=function_row, column=function_id_col, value=function_id)
        ws.cell(row=function_row, column=function_name_col, value=function_display_name)

    for child_name, child_data in data['children'].items():
        add_to_sheet(ws, child_data, level + 1, system_ids, function_ids)

def export_allocations_to_excel(allocations_file, parts_file, functions_file, output_path):
    """Export all allocations from the files to an Excel file."""
    output_path.parent.mkdir(parents=True, exist_ok=True)

    allocations = parse_allocations_file(allocations_file)
    system_ids = get_system_ids(parts_file)
    function_ids = get_function_ids(functions_file)

    wb = create_workbook()
    ws = wb["Allocations"]

    for system_name, system_data in allocations.items():
        add_to_sheet(ws, system_data, 0, system_ids, function_ids)

    for column in ws.columns:
        max_length = 0
        column_letter = column[0].column_letter
        for cell in column:
            try:
                if len(str(cell.value)) > max_length:
                    max_length = len(str(cell.value))
            except:
                pass
        adjusted_width = (max_length + 2) * 1.2
        ws.column_dimensions[column_letter].width = adjusted_width

    wb.save(output_path)
    print(f"Exported allocations to: {output_path}")

# ---------------------------------------------------------------------------
# Main function
# ---------------------------------------------------------------------------

def main():
    _DVS_DIR = pathlib.Path(__file__).parent.parent
    DEFAULT_ALLOCATIONS_INPUT = _DVS_DIR / "Allocations_generated.sysml"
    DEFAULT_PARTS_INPUT = _DVS_DIR / "Parts_generated.sysml"
    DEFAULT_FUNCTIONS_INPUT = _DVS_DIR / "Functions_generated.sysml"
    DEFAULT_OUTPUT = _DVS_DIR / "results" / "DVS_Allocations_export.xlsx"

    args = sys.argv[1:]
    if args and args[0] in ("-h", "--help"):
        print(__doc__)
        sys.exit(0)

    allocations_input = DEFAULT_ALLOCATIONS_INPUT
    parts_input = DEFAULT_PARTS_INPUT
    functions_input = DEFAULT_FUNCTIONS_INPUT
    output_path = DEFAULT_OUTPUT

    if len(args) >= 1:
        allocations_input = pathlib.Path(args[0])
    if len(args) >= 2:
        parts_input = pathlib.Path(args[1])
    if len(args) >= 3:
        functions_input = pathlib.Path(args[2])
    if len(args) >= 4:
        output_path = pathlib.Path(args[3])

    if not allocations_input.exists():
        print(f"Error: Allocations file not found: {allocations_input}", file=sys.stderr)
        sys.exit(1)
    if not parts_input.exists():
        print(f"Error: Parts file not found: {parts_input}", file=sys.stderr)
        sys.exit(1)
    if not functions_input.exists():
        print(f"Error: Functions file not found: {functions_input}", file=sys.stderr)
        sys.exit(1)

    print(f"Reading allocations from: {allocations_input}")
    print(f"Reading parts from: {parts_input}")
    print(f"Reading functions from: {functions_input}")

    export_allocations_to_excel(allocations_input, parts_input, functions_input, output_path)

if __name__ == "__main__":
    main()