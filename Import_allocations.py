""" 
Werkt nog niet helemaal naar behoren, is volgens mij niet volledig onafhankelijk van het niveau van systems en functies.
Verder maakt hij een nieuw .sysml bestand aan ipv het parts.sysml bestand aan te passen. En de ID vind functionaliteit werkt niet
volledig. Gebruik de id vind functies van de export scripts. 
"""

#!/usr/bin/env python3
"""
import_allocations_from_excel.py
Generates a SysML v2 .sysml file containing function allocations from an Excel or CSV file.

Expected file layout:
  | System ID | System Name | SubSystem ID | SubSystem Name | ... | Function ID | Function Name | SubFunction ID | SubFunction Name | ...

Each row represents either:
- A system/subsystem at some level (with ID and Name filled)
- A function allocation to the last specified system level

Usage:
  python import_allocations_from_excel.py <input.xlsx|input.csv> [output.sysml] [PackageName]

Requirements:
  pip install openpyxl
  pip install syside
"""

import csv
import pathlib
import re
import sys
from dataclasses import dataclass
from typing import Dict, List, Optional, Tuple

import syside

try:
    import openpyxl
except ImportError:
    print("Error: openpyxl is required. Install it with: pip install openpyxl", file=sys.stderr)
    sys.exit(1)

INDENT = "    "

@dataclass
class Allocation:
    target_system_path: List[str]  # Path to target system (e.g., ["LogicalSystem", "EPS"])
    target_system_id: str          # ID of the target system
    function_name: str              # Name of the function to allocate
    function_id: str               # ID of the function

def to_type_name(name: str) -> str:
    """
    Convert a part name to a valid SysML part def identifier (PascalCase).
    ALL-CAPS abbreviations (EPS, ADCS, OBC) are preserved as-is.

    Examples:
      "Logical System"      -> "LogicalSystem"
      "EPS"                 -> "EPS"
      "SE team"             -> "SETeam"
      "Da Vinci Satellite"  -> "DaVinciSatellite"
      "Place/keep mode"     -> "PlaceKeepMode"
    """
    words = re.split(r"[\s/\-_]+", name.strip())
    result = []
    for word in words:
        cleaned = re.sub(r"[^A-Za-z0-9]", "", word)
        if not cleaned:
            continue
        if cleaned.isupper() and len(cleaned) > 1:
            result.append(cleaned)          # keep abbreviations intact
        else:
            result.append(cleaned[0].upper() + cleaned[1:])
    return "".join(result)

def to_usage_name(name: str) -> str:
    """
    Convert a part name to a valid SysML part usage identifier (camelCase).
    Initial ALL-CAPS abbreviations are lowercased as a group.

    Examples:
      "Logical System"  -> "logicalSystem"
      "EPS"             -> "eps"
      "SE team"         -> "seTeam"
      "AIV team"        -> "aivTeam"
      "BitflipPayload"  -> "bitflipPayload"
    """
    type_name = to_type_name(name)
    if not type_name:
        return name

    # Lowercase the leading all-caps abbreviation (if any).
    # Stop lowercasing at the last uppercase letter that is immediately followed
    # by a lowercase letter (that upper letter starts the next PascalCase word).
    n = len(type_name)
    end_prefix = 0

    for i in range(n):
        ch = type_name[i]
        if ch.isupper():
            next_is_lower = (i + 1 < n and type_name[i + 1].islower())
            if next_is_lower and i > 0:
                # This capital starts a new word after an abbreviation → stop here
                end_prefix = i
                break
            else:
                end_prefix = i + 1
        else:
            break

    if end_prefix == 0:
        end_prefix = 1

    return type_name[:end_prefix].lower() + type_name[end_prefix:]

def _detect_level_columns(header: tuple) -> list[tuple[int, int]]:
    """
    Detect (id_col, name_col) index pairs for each hierarchy level.

    Works regardless of how many extra columns (e.g. Type, Description) sit
    between or after each ID/Name pair.  For each column whose header contains
    'id', the nearest following column whose header contains 'name' is taken as
    its partner.

    Example header:
      System ID | System Name | System Type | SubSystem ID | SubSystem Name | ...
    Returns: [(0, 1), (3, 4), ...]
    """
    h = [str(c).lower().strip() if c else "" for c in header]
    id_cols = [i for i, v in enumerate(h) if "id" in v and v]
    pairs: list[tuple[int, int]] = []
    for id_col in id_cols:
        for name_col in range(id_col + 1, len(h)):
            if "name" in h[name_col]:
                pairs.append((id_col, name_col))
                break
    return pairs

def _parse_allocation_rows(rows: list[tuple]) -> list[Allocation]:
    """
    Build a list of Allocation objects from the row data.

    The first row is the header. Each data row carries information at exactly
    one hierarchy level (identified by which ID/Name pair is filled).
    """
    if not rows:
        return []

    header = rows[0]
    level_cols = _detect_level_columns(header)
    if not level_cols:
        print("Warning: could not detect ID/Name column pairs from header.", file=sys.stderr)
        print(f"  Header: {header}", file=sys.stderr)
        return []

    # Find function columns (last two ID/Name pairs)
    func_id_col, func_name_col = level_cols[-2]
    subfunc_id_col, subfunc_name_col = level_cols[-1]

    allocations = []
    current_system_path = []
    current_system_id = ""

    for row in rows[1:]:
        row = list(row) + [None] * (len(level_cols) * 3)

        # Check for system levels (any level except the last two which are functions)
        system_found = False
        for level, (id_col, name_col) in enumerate(level_cols[:-2]):
            cell_id = row[id_col]
            cell_name = row[name_col]

            if cell_id and cell_name:
                # Found a system at this level
                system_found = True
                current_system_id = str(cell_id).strip()
                current_system_name = str(cell_name).strip()
                current_system_path = current_system_path[:level]
                current_system_path.append(current_system_name)
                break

        # If no system found in this row, we might have a function allocation
        if not system_found:
            # Get function info
            func_id = str(row[func_id_col]).strip() if row[func_id_col] else ""
            func_name = str(row[func_name_col]).strip() if row[func_name_col] else ""
            subfunc_id = str(row[subfunc_id_col]).strip() if row[subfunc_id_col] else ""
            subfunc_name = str(row[subfunc_name_col]).strip() if row[subfunc_name_col] else ""

            if func_name or subfunc_name:
                # This is a function allocation row
                function_name = subfunc_name if subfunc_name else func_name
                function_id = subfunc_id if subfunc_id else func_id

                if current_system_path:
                    allocations.append(Allocation(
                        target_system_path=current_system_path.copy(),
                        target_system_id=current_system_id,
                        function_name=function_name,
                        function_id=function_id
                    ))
                else:
                    print(f"Warning: Function '{function_name}' has no target system", file=sys.stderr)

    return allocations

def read_excel(path: pathlib.Path) -> list[Allocation]:
    wb = openpyxl.load_workbook(path, data_only=True)
    ws = wb.active
    rows = list(ws.iter_rows(values_only=True))
    return _parse_allocation_rows(rows)

def read_csv(path: pathlib.Path) -> list[Allocation]:
    # Auto-detect delimiter (semicolon or comma)
    sample = path.read_text(encoding="utf-8-sig")[:2048]
    delimiter = ";" if sample.count(";") > sample.count(",") else ","
    with path.open(encoding="utf-8-sig") as f:
        reader = csv.reader(f, delimiter=delimiter)
        rows = [tuple(row) for row in reader]
    return _parse_allocation_rows(rows)

def load_allocations(path: pathlib.Path) -> list[Allocation]:
    suffix = path.suffix.lower()
    if suffix in (".xlsx", ".xlsm", ".xls"):
        return read_excel(path)
    elif suffix in (".csv", ".tsv"):
        return read_csv(path)
    else:
        # Try Excel first, fall back to CSV
        try:
            return read_excel(path)
        except Exception:
            return read_csv(path)

def get_element_id(element: syside.Element) -> Optional[str]:
    """Extract ID from element documentation."""
    for doc in element.documentation:
        if "ID:" in doc.body:
            match = re.search(r"ID:\s*([^\s]+)", doc.body)
            if match:
                return match.group(1)
    return None

def generate_allocations_sysml(
    allocations: list[Allocation],
    package_name: str = "Allocations"
) -> str:
    """
    Produce a complete SysML v2 package string with function allocations.

    Output structure matches the Parts_generated.sysml file but with
    perform action statements instead of part usages.
    """
    lines: list[str] = [
        f"package {package_name} {{",
        f"{INDENT}private import DVS_functions::*;",
        ""
    ]

    # Group allocations by target system path
    system_allocations: Dict[str, List[Allocation]] = {}
    for alloc in allocations:
        system_key = ".".join(alloc.target_system_path)
        if system_key not in system_allocations:
            system_allocations[system_key] = []
        system_allocations[system_key].append(alloc)

    # Process each system in the same order as Parts_generated.sysml
    # First LogicalSystem with all its subsystems
    if "LogicalSystem" in system_allocations:
        lines.append(f"{INDENT}part def LogicalSystem {{")

        # Find all subsystems of LogicalSystem
        logical_system_allocs = system_allocations["LogicalSystem"]

        # Add perform statements for functions allocated directly to LogicalSystem
        for alloc in logical_system_allocs:
            function_name = alloc.function_name
            action_name = to_usage_name(function_name)
            action_type = to_type_name(function_name)
            lines.append(f"{INDENT * 2}perform action {action_name} : {action_type};")

        # Now process each subsystem
        for system_key in system_allocations:
            if system_key != "LogicalSystem" and system_key.startswith("LogicalSystem."):
                subsystem_name = system_key.split(".")[1]
                subsystem_allocs = system_allocations[system_key]

                lines.append(f"{INDENT * 2}part {to_usage_name(subsystem_name)} : {to_type_name(subsystem_name)} {{")

                for alloc in subsystem_allocs:
                    function_name = alloc.function_name
                    action_name = to_usage_name(function_name)
                    action_type = to_type_name(function_name)
                    lines.append(f"{INDENT * 3}perform action {action_name} : {action_type};")

                lines.append(f"{INDENT * 2}}}")

        lines.append(f"{INDENT}}}")
        lines.append("")

    # Process other top-level systems (not part of LogicalSystem)
    for system_key in system_allocations:
        if not system_key.startswith("LogicalSystem.") and system_key != "LogicalSystem":
            system_name = system_key.split(".")[-1]
            system_allocs = system_allocations[system_key]

            lines.append(f"{INDENT}part def {to_type_name(system_name)} {{")

            for alloc in system_allocs:
                function_name = alloc.function_name
                action_name = to_usage_name(function_name)
                action_type = to_type_name(function_name)
                lines.append(f"{INDENT * 2}perform action {action_name} : {action_type};")

            lines.append(f"{INDENT}}}")
            lines.append("")

    lines.append("}")
    return "\n".join(lines)

def main() -> None:
    # -----------------------------------------------------------------------
    # Configure paths here when running directly (without command-line args)
    # Paths are relative to this script's location (DVS/scripts/).
    # -----------------------------------------------------------------------
    _DVS_DIR        = pathlib.Path(__file__).parent.parent
    DEFAULT_INPUT   = _DVS_DIR / "data" / "DVS_Function_System_Links.xlsx"
    DEFAULT_OUTPUT  = _DVS_DIR / "Allocations_generated.sysml"
    DEFAULT_PACKAGE = "Allocations"  # leave "" to derive from output filename
    # -----------------------------------------------------------------------

    args = sys.argv[1:]
    if args and args[0] in ("-h", "--help"):
        print(__doc__)
        sys.exit(0)

    input_path = pathlib.Path(args[0]) if args else DEFAULT_INPUT
    if not input_path or not input_path.exists():
        if not args:
            print("Error: set DEFAULT_INPUT at the top of main(), or pass the file as an argument.", file=sys.stderr)
        else:
            print(f"Error: file not found: {input_path}", file=sys.stderr)
        sys.exit(1)

    output_path = (
        pathlib.Path(args[1]) if len(args) >= 2
        else DEFAULT_OUTPUT if DEFAULT_OUTPUT.name
        else input_path.with_suffix(".sysml")
    )
    package_name = (
        args[2] if len(args) >= 3
        else DEFAULT_PACKAGE if DEFAULT_PACKAGE
        else to_type_name(output_path.stem)
    )

    print(f"Reading:  {input_path}")
    allocations = load_allocations(input_path)

    if not allocations:
        print("No allocations found in the input file. Check the column layout.", file=sys.stderr)
        sys.exit(1)

    print(f"Found:    {len(allocations)} allocations")

    # Print allocations for debugging
    print("\nAllocations found:")
    for alloc in allocations:
        # print(f"  {'.".join(alloc.target_system_path)} ({alloc.target_system_id}) <- {alloc.function_name} ({alloc.function_id})")
        a=1

    # Generate SysML code
    sysml = generate_allocations_sysml(allocations, package_name)

    # Write output
    output_path.write_text(sysml, encoding="utf-8")
    print(f"Written:  {output_path}")

if __name__ == "__main__":
    main()