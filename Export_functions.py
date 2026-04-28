#!/usr/bin/env python3
"""
export_functions_to_excel.py
Exports functions from a SysML v2 file to an Excel file with hierarchical structure.
Function names are converted from PascalCase to space-separated words.

Expected output format:
- Row 1: Headers (Function ID, Function Name, Function Kind, SubFunction ID, etc.)
- Row 2: Function (only Function columns filled with space-separated name)
- Row 3: SubFunction (only SubFunction columns filled with space-separated name)
- etc.

Each row contains exactly one level of the hierarchy with all higher levels blank.
"""

import pathlib
import re
import sys
from typing import Dict, List, Optional, Tuple

import syside
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

def get_element_id(element: syside.Element) -> Optional[str]:
    """Extract ID from element documentation or element_id."""
    # First try to get ID from documentation
    for doc in element.documentation:
        if "ID:" in doc.body:
            match = re.search(r"ID:\s*([^\s]+)", doc.body)
            if match:
                return match.group(1)

    # Fallback to element_id if documentation doesn't contain ID
    if hasattr(element, 'element_id') and element.element_id:
        return element.element_id

    return None

def to_type_name(name: str) -> str:
    """
    Convert a function name to a valid SysML action def identifier (PascalCase).
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

def from_pascal_case(name: str) -> str:
    """
    Convert PascalCase to space-separated words.
    Examples:
      "ReceiveMissionStatus" -> "Receive Mission Status"
      "CODESelectCompanies" -> "CODE Select Companies"
      "DetermineAttitude" -> "Determine Attitude"
    """
    # Handle special case for ALL-CAPS prefixes (like CODE)
    result = []
    i = 0
    n = len(name)

    # Check for ALL-CAPS prefix
    while i < n and name[i].isupper():
        # Find the end of the ALL-CAPS sequence
        j = i
        while j < n and name[j].isupper():
            j += 1
        if j > i:
            result.append(name[i:j])
            i = j

    # Process the rest of the string
    while i < n:
        if name[i].isupper() and i > 0 and not name[i-1].isupper():
            result.append(" ")
        result.append(name[i])
        i += 1

    return "".join(result).strip()

# ---------------------------------------------------------------------------
# Excel export functions
# ---------------------------------------------------------------------------

def create_workbook(max_levels: int = 4) -> openpyxl.Workbook:
    """Create a new workbook with headers for the given number of levels."""
    wb = openpyxl.Workbook()

    # Remove the default sheet if it exists
    if wb.active.title == "Sheet":
        wb.remove(wb.active)

    # Create a new sheet
    ws = wb.create_sheet("Functions")

    # Set headers based on max levels
    headers = []
    for level in range(max_levels):
        prefix = "Sub" * level if level > 0 else ""
        headers.extend([
            f"{prefix}Function ID",
            f"{prefix}Function Name",
            f"{prefix}Function Kind"
        ])

    for col, header in enumerate(headers, 1):
        ws.cell(row=1, column=col, value=header)

    # Style headers
    for cell in ws[1]:
        cell.fill = PatternFill(start_color="D3D3D3", end_color="D3D3D3", fill_type="solid")

    return wb

def find_max_hierarchy_level(element: syside.Element) -> int:
    """Find the maximum hierarchy level in the function structure."""
    if not hasattr(element, 'owned_elements'):
        return 0

    max_level = 0
    for child in element.owned_elements:
        if isinstance(child, syside.ActionUsage):
            level = find_max_hierarchy_level(child.types[0]) + 1 if child.types else 0
            if level > max_level:
                max_level = level

    return max_level

def add_function_to_sheet(ws: openpyxl.worksheet.worksheet.Worksheet,
                          function: syside.Element,
                          level: int = 0) -> None:
    """
    Add a function to the worksheet at the appropriate level.
    Only fills columns for the current level, leaving all higher levels blank.
    Converts PascalCase names to space-separated words.
    """
    # Calculate column indices for this level
    id_col = 1 + (level * 3)
    name_col = 2 + (level * 3)
    kind_col = 3 + (level * 3)

    # Get function ID
    function_id = get_element_id(function)
    if not function_id:
        function_id = ""

    # Convert PascalCase name to space-separated words
    display_name = from_pascal_case(function.name)

    # Create a new row
    new_row = ws.max_row + 1

    # ONLY fill in the columns for the current level
    ws.cell(row=new_row, column=id_col, value=function_id)
    ws.cell(row=new_row, column=name_col, value=display_name)
    # Leave kind column empty as requested

    # Process children (action usages) at the next level
    if hasattr(function, 'owned_elements'):
        for child in function.owned_elements:
            if isinstance(child, syside.ActionUsage) and child.types:
                child_type = child.types[0]
                if isinstance(child_type, syside.ActionDefinition):
                    add_function_to_sheet(ws, child_type, level + 1)

def export_functions_to_excel(model: syside.Model, output_path: pathlib.Path) -> None:
    """Export all functions from the model to an Excel file."""
    # Create output directory if it doesn't exist
    output_path.parent.mkdir(parents=True, exist_ok=True)

    # Find the FunctionsGenerated package
    functions_package = None
    for element in model.elements(syside.Package, include_subtypes=True):
        if element.name == "FunctionsGenerated":
            functions_package = element
            break

    if not functions_package:
        print("Error: FunctionsGenerated package not found in model", file=sys.stderr)
        return

    # Find the maximum hierarchy level
    max_levels = 1  # At least 1 level (top-level functions)
    for element in functions_package.owned_elements:
        if isinstance(element, syside.ActionDefinition):
            level = find_max_hierarchy_level(element) + 1
            if level > max_levels:
                max_levels = level

    # Create workbook with appropriate number of levels
    wb = create_workbook(max_levels)
    ws = wb["Functions"]

    # Process all top-level functions
    for element in functions_package.owned_elements:
        if isinstance(element, syside.ActionDefinition):
            add_function_to_sheet(ws, element)

    # Auto-adjust column widths
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

    # Save the workbook
    wb.save(output_path)
    print(f"Exported functions to: {output_path}")

# ---------------------------------------------------------------------------
# Main function
# ---------------------------------------------------------------------------

def main() -> None:
    # -----------------------------------------------------------------------
    # Configure paths here when running directly (without command-line args)
    # -----------------------------------------------------------------------
    _DVS_DIR = pathlib.Path(__file__).parent.parent
    DEFAULT_INPUT = _DVS_DIR / "Functions_generated.sysml"
    DEFAULT_OUTPUT = _DVS_DIR / "results" / "DVS_Functions_export.xlsx"
    # -----------------------------------------------------------------------

    args = sys.argv[1:]
    if args and args[0] in ("-h", "--help"):
        print(__doc__)
        sys.exit(0)

    input_path = pathlib.Path(args[0]) if args else DEFAULT_INPUT
    if not input_path or not input_path.exists():
        if not args:
            print("Error: set DEFAULT_INPUT or pass the file as an argument.", file=sys.stderr)
        else:
            print(f"Error: file not found: {input_path}", file=sys.stderr)
        sys.exit(1)

    output_path = DEFAULT_OUTPUT if len(args) < 2 else pathlib.Path(args[1])

    print(f"Reading:  {input_path}")

    # Load the SysML model
    model, diagnostics = syside.load_model([input_path])
    if diagnostics.contains_errors():
        print("Errors loading model:", file=sys.stderr)
        for d in diagnostics:
            print(f"  {d}", file=sys.stderr)
        sys.exit(1)

    # Export to Excel
    export_functions_to_excel(model, output_path)

if __name__ == "__main__":
    main()