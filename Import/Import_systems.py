#!/usr/bin/env python3
"""
import_parts_from_excel.py
Generates a SysML v2 .sysml file containing part definitions from an Excel or CSV file.

Expected file layout (one row per component, blank cells inherit parent context):

  | System ID | System Name | SubSystem ID | SubSystem Name | SubSubSystem ID | SubSubSystem Name | ...
  |-----------|-------------|--------------|----------------|-----------------|-------------------|
  | abc123    | Logical System |           |                |                 |                   |
  |           |             | def456       | EPS            |                 |                   |
  |           |             | ghi789       | ADCS           |                 |                   |

Each pair of columns (ID, Name) represents one hierarchy level.
A row with data in level N is a child of the most recent row with data in level N-1.

ID placement rule:
  - A type that is used as a part usage inside another part def keeps its ID in the usage block.
  - A type that only appears as a top-level part def (never used as a child) keeps its ID in the def.

Usage:
  python import_parts_from_excel.py <input.xlsx|input.csv> [output.sysml] [PackageName]

Requirements:
  pip install openpyxl

Modification:
  - Part names are now made unique by appending the first 4 characters of their ID
  - This ensures no duplicate names in the SysML syntax
"""

import csv
import pathlib
import re
import subprocess
import sys
from dataclasses import dataclass, field
from typing import Optional

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
class PartNode:
    name: str
    id: str = ""
    children: list["PartNode"] = field(default_factory=list)

# ---------------------------------------------------------------------------
# Name conversion helpers
# ---------------------------------------------------------------------------

def to_type_name(name: str, part_id: str = "") -> str:
    """
    Convert a part name to a valid SysML part def identifier (PascalCase).
    ALL-CAPS abbreviations (EPS, ADCS, OBC) are preserved as-is.
    Appends first 4 characters of ID to ensure uniqueness.

    Examples:
      "Logical System" with ID "abc123..." -> "LogicalSystem_abcd"
      "EPS" with ID "def456..." -> "EPS_def4"
      "SE team" with ID "ghi789..." -> "SETeam_ghi7"
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
    type_name = "".join(result)

    # Append first 4 characters of ID if available
    if part_id:
        id_prefix = part_id[:4]
        return f"{type_name}_{id_prefix}"
    return type_name

def to_usage_name(name: str, part_id: str = "") -> str:
    """
    Convert a part name to a valid SysML part usage identifier (camelCase).
    Initial ALL-CAPS abbreviations are lowercased as a group.
    Appends first 4 characters of ID to ensure uniqueness.

    Examples:
      "Logical System" with ID "abc123..." -> "logicalSystem_abcd"
      "EPS" with ID "def456..." -> "eps_def4"
      "SE team" with ID "ghi789..." -> "seTeam_ghi7"
    """
    type_name = to_type_name(name, part_id)
    if not type_name:
        return name

    # Lowercase the leading all-caps abbreviation (if any).
    # Stop lowercasing at the last uppercase letter that is immediately followed
    # by a lowercase letter (that upper letter starts the next PascalCase word).
    n = len(type_name)
    end_prefix = 0

    # First find where the ID prefix starts (after the underscore)
    underscore_pos = type_name.find('_')
    if underscore_pos != -1:
        # Process only the name part before the underscore
        name_part = type_name[:underscore_pos]
        id_part = type_name[underscore_pos:]
    else:
        name_part = type_name
        id_part = ""

    n = len(name_part)
    for i in range(n):
        ch = name_part[i]
        if ch.isupper():
            next_is_lower = (i + 1 < n and name_part[i + 1].islower())
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

    camel_name = name_part[:end_prefix].lower() + name_part[end_prefix:]
    return f"{camel_name}{id_part}"

# ---------------------------------------------------------------------------
# Excel / CSV parsing
# ---------------------------------------------------------------------------

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

def _parse_rows(rows: list[tuple]) -> list[PartNode]:
    """
    Build a PartNode tree from a sequence of rows.

    The first row is treated as the header; column positions are auto-detected
    so extra columns (Type, Description, …) between ID/Name pairs are ignored.
    Each data row carries data at exactly one hierarchy level.
    """
    if not rows:
        return []

    level_cols = _detect_level_columns(rows[0])
    if not level_cols:
        print("Warning: could not detect ID/Name column pairs from the header.", file=sys.stderr)
        print(f"  Header: {rows[0]}", file=sys.stderr)
        return []

    data_rows = rows[1:]
    roots: list[PartNode] = []
    current_at_level: dict[int, PartNode] = {}

    for row in data_rows:
        row = list(row) + [None] * (len(level_cols) * 3)  # pad to be safe

        for level, (col_id, col_name) in enumerate(level_cols):
            cell_id = row[col_id]
            cell_name = row[col_name]

            if cell_id and cell_name:
                node = PartNode(
                    name=str(cell_name).strip(),
                    id=str(cell_id).strip(),
                )
                current_at_level[level] = node
                for deeper in [k for k in current_at_level if k > level]:
                    del current_at_level[deeper]

                if level == 0:
                    roots.append(node)
                elif (level - 1) in current_at_level:
                    current_at_level[level - 1].children.append(node)

                break

    return roots

def read_excel(path: pathlib.Path) -> list[PartNode]:
    wb = openpyxl.load_workbook(path, data_only=True)
    ws = wb.active
    rows = list(ws.iter_rows(values_only=True))
    return _parse_rows(rows)

def read_csv(path: pathlib.Path) -> list[PartNode]:
    # Auto-detect delimiter (semicolon or comma)
    sample = path.read_text(encoding="utf-8-sig")[:2048]
    delimiter = ";" if sample.count(";") > sample.count(",") else ","
    with path.open(encoding="utf-8-sig") as f:
        reader = csv.reader(f, delimiter=delimiter)
        rows = [tuple(row) for row in reader]
    return _parse_rows(rows)

def load_parts(path: pathlib.Path) -> list[PartNode]:
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

# ---------------------------------------------------------------------------
# SysML v2 code generation
# ---------------------------------------------------------------------------

def _collect_canonical_types(parts: list[PartNode]) -> dict[str, PartNode]:
    """
    Walk the tree and build a dict of type_name -> canonical PartNode.
    When two nodes share the same type name, prefer the one that has children
    (it carries structural information needed for the part def body).
    Now uses the modified type name with ID prefix.
    """
    canonical: dict[str, PartNode] = {}

    def walk(node: PartNode) -> None:
        # Use the node's ID to create a unique type name
        tname = to_type_name(node.name, node.id)
        if tname not in canonical:
            canonical[tname] = node
        elif node.children and not canonical[tname].children:
            canonical[tname] = node   # upgrade to the richer version
        for child in node.children:
            walk(child)

    for root in parts:
        walk(root)
    return canonical

def _collect_all_ids(parts: list[PartNode]) -> dict[str, list[str]]:
    """Return a mapping of type_name -> list of all IDs that share that type name.
    Now uses the modified type name with ID prefix.
    """
    all_ids: dict[str, list[str]] = {}

    def walk(node: PartNode) -> None:
        # Use the node's ID to create a unique type name
        tname = to_type_name(node.name, node.id)
        if node.id and node.id not in all_ids.get(tname, []):
            all_ids.setdefault(tname, []).append(node.id)
        for child in node.children:
            walk(child)

    for root in parts:
        walk(root)
    return all_ids

def generate_sysml(parts: list[PartNode], package_name: str = "Parts") -> str:
    """
    Produce a complete SysML v2 package string.

    IDs always go in the part def block. When multiple Excel rows share the same
    type name (e.g. two "Ground station" entries), all their IDs are written so
    that the exchange script can inject ports for every variant.

    Part usages are plain single-line declarations so that ports land on the
    canonical part def and are reachable from package-level connection defs.
    """
    canonical = _collect_canonical_types(parts)
    all_ids   = _collect_all_ids(parts)
    emitted: set[str] = set()

    lines: list[str] = [f"package {package_name} {{", ""]

    def emit(node: PartNode) -> None:
        # Use the node's ID to create a unique type name
        tname = to_type_name(node.name, node.id)
        if tname in emitted:
            return
        emitted.add(tname)

        cn = canonical[tname]

        lines.append(f"{INDENT}part def {tname} {{")
        for id_val in all_ids.get(tname, []):
            lines.append(f"{INDENT * 2}doc")
            lines.append(f"{INDENT * 2}/* ID: {id_val} */")
        for child in cn.children:
            # For child usages, use the child's ID to create unique usage name
            child_type = to_type_name(child.name, child.id)
            child_usage = to_usage_name(child.name, child.id)
            lines.append(f"{INDENT * 2}part {child_usage} : {child_type};")
        lines.append(f"{INDENT}}}")
        lines.append("")

        for child in cn.children:
            emit(child)

    for root in parts:
        emit(root)

    lines.append("}")
    return "\n".join(lines)

# ---------------------------------------------------------------------------
# Validation (optional syside check)
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
        print("Validation passed (no errors).")
        return True
    except FileNotFoundError:
        print("syside not found — skipping validation.")
        return True

# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def main() -> None:
    # -----------------------------------------------------------------------
    # Configure paths here when running directly (without command-line args)
    # Paths are relative to this script's location (DVS/scripts/).
    # -----------------------------------------------------------------------
    _DVS_DIR        = pathlib.Path(__file__).parent.parent
    DEFAULT_INPUT   = _DVS_DIR / "data" / "DVS_Logical_System.xlsx"
    DEFAULT_OUTPUT  = _DVS_DIR / "Parts_generated.sysml"
    DEFAULT_PACKAGE = ""        # leave "" to derive from output filename
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
    parts = load_parts(input_path)

    if not parts:
        print("No parts found in the input file. Check the column layout.", file=sys.stderr)
        sys.exit(1)

    total = sum(1 for _ in _collect_canonical_types(parts))
    print(f"Found:    {len(parts)} top-level systems, {total} unique part types")

    sysml = generate_sysml(parts, package_name)

    output_path.write_text(sysml, encoding="utf-8")
    print(f"Written:  {output_path}")

    validate(output_path)

if __name__ == "__main__":
    main()