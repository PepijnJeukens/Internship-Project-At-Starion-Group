#!/usr/bin/env python3
"""
export_parts_to_excel.py
Exports parts from a SysML v2 file to an Excel file with proper hierarchical structure and IDs.
Part names are converted from PascalCase to space-separated words with correct handling of acronyms.

Expected output format:
- Row 1: Headers
- Row 2: System (only System columns filled with ID and properly spaced Name)
- Row 3: SubSystem (only SubSystem columns filled with ID and properly spaced Name)
- etc.
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
    Convert a part name to a valid SysML part def identifier (PascalCase).
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
    Convert PascalCase to space-separated words with proper handling of acronyms.

    Rules:
    1. Insert space before every capital letter that is followed by a lowercase letter
    2. Keep sequences of capital letters together (treat as acronyms)
    3. Special case: if the entire word is uppercase, keep it as is

    Examples:
      "LogicalSystem" -> "Logical System"
      "PrimarySchoolStudents" -> "Primary School Students"
      "DVSTeam" -> "DVS Team"
      "EPS" -> "EPS"
      "SETeam" -> "SE Team"
      "DaVinciSatellite" -> "Da Vinci Satellite"
      "PlaceKeepMode" -> "Place Keep Mode"
    """
    if not name:
        return name

    # Special case: if the entire name is uppercase, return as is
    if name.isupper():
        return name

    result = []
    i = 0
    n = len(name)

    while i < n:
        # Check if we're at the start of an acronym (sequence of capital letters)
        if name[i].isupper():
            # Find the end of the acronym sequence
            j = i
            while j < n and name[j].isupper():
                j += 1

            # If this is the entire string, just add it
            if j == n:
                result.append(name[i:j])
                i = j
            # If the acronym is followed by a lowercase letter, add space before last capital
            elif j < n and name[j].islower():
                # Add all but last capital letter
                result.append(name[i:j-1])
                # Add space and last capital letter
                result.append(" " + name[j-1])
                i = j
            # Otherwise just add the acronym
            else:
                result.append(name[i:j])
                i = j
        else:
            result.append(name[i])
            i += 1

    # Join and clean up any double spaces
    return "".join(result).replace("  ", " ").strip()

# ---------------------------------------------------------------------------
# Excel export functions
# ---------------------------------------------------------------------------

def create_workbook() -> openpyxl.Workbook:
    """Create a new workbook with headers."""
    wb = openpyxl.Workbook()

    # Remove the default sheet if it exists
    if wb.active.title == "Sheet":
        wb.remove(wb.active)

    # Create a new sheet
    ws = wb.create_sheet("Parts")

    # Set headers
    headers = [
        "System ID", "System Name", "System Type",
        "SubSystem ID", "SubSystem Name", "SubSystem Type",
        "SubSubSystem ID", "SubSubSystem Name", "SubSubSystem Type",
        "SubSubSubSystem ID", "SubSubSubSystem Name", "SubSubSubSystem Type"
    ]

    for col, header in enumerate(headers, 1):
        ws.cell(row=1, column=col, value=header)

    # Style headers
    for cell in ws[1]:
        cell.fill = PatternFill(start_color="D3D3D3", end_color="D3D3D3", fill_type="solid")

    return wb

def add_part_to_sheet(ws: openpyxl.worksheet.worksheet.Worksheet,
                     part: syside.PartDefinition,
                     level: int = 0) -> None:
    """
    Add a part to the worksheet at the appropriate level.
    Only fills columns for the current level, leaving all higher levels blank.
    Converts PascalCase names to space-separated words with proper acronym handling.
    """
    # Calculate column indices for this level
    id_col = 1 + (level * 3)
    name_col = 2 + (level * 3)

    # Get part ID (prefer documentation, fallback to element_id)
    part_id = get_element_id(part)
    if not part_id:
        part_id = ""

    # Convert PascalCase name to space-separated words
    display_name = from_pascal_case(part.name)

    # Create a new row
    new_row = ws.max_row + 1

    # ONLY fill in the columns for the current level
    ws.cell(row=new_row, column=id_col, value=part_id)
    ws.cell(row=new_row, column=name_col, value=display_name)

    # Process children (part usages) at the next level
    for child_usage in part.owned_elements:
        if isinstance(child_usage, syside.PartUsage):
            # Find the part definition for this usage
            if hasattr(child_usage, 'types') and child_usage.types:
                child_type = child_usage.types[0]
                if isinstance(child_type, syside.PartDefinition):
                    add_part_to_sheet(ws, child_type, level + 1)

def export_parts_to_excel(model: syside.Model, output_path: pathlib.Path) -> None:
    """Export all parts from the model to an Excel file."""
    # Create output directory if it doesn't exist
    output_path.parent.mkdir(parents=True, exist_ok=True)

    # Create workbook
    wb = create_workbook()
    ws = wb["Parts"]

    # Find the PartsGenerated package
    parts_package = None
    for element in model.elements(syside.Package, include_subtypes=True):
        if element.name == "PartsGenerated":
            parts_package = element
            break

    if not parts_package:
        print("Error: PartsGenerated package not found in model", file=sys.stderr)
        return

    # Find and process LogicalSystem first
    logical_system = None
    for element in parts_package.owned_elements:
        if isinstance(element, syside.PartDefinition) and element.name == "LogicalSystem":
            logical_system = element
            break

    if logical_system:
        add_part_to_sheet(ws, logical_system)

    # Process other top-level parts that aren't part of LogicalSystem
    for element in parts_package.owned_elements:
        if isinstance(element, syside.PartDefinition) and element.name != "LogicalSystem":
            # Check if this part is used in LogicalSystem
            is_in_logical_system = False
            if logical_system:
                for usage in logical_system.owned_elements:
                    if isinstance(usage, syside.PartUsage) and usage.types and usage.types[0] == element:
                        is_in_logical_system = True
                        break

            # Only add if not already included as part of LogicalSystem
            if not is_in_logical_system:
                add_part_to_sheet(ws, element)

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
    print(f"Exported parts to: {output_path}")

# ---------------------------------------------------------------------------
# Main function
# ---------------------------------------------------------------------------

def main() -> None:
    # -----------------------------------------------------------------------
    # Configure paths here when running directly (without command-line args)
    # -----------------------------------------------------------------------
    _DVS_DIR = pathlib.Path(__file__).parent.parent
    DEFAULT_INPUT = _DVS_DIR / "Parts_generated.sysml"
    DEFAULT_OUTPUT = _DVS_DIR / "results" / "DVS_Parts_export.xlsx"
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
    export_parts_to_excel(model, output_path)

if __name__ == "__main__":
    main()