#!/usr/bin/env python3
"""
import_functions_from_excel.py
Generates a SysML v2 .sysml file containing action definitions from an Excel or CSV file.

Expected file layout:

  | Function ID | Function Name | Function Kind | SubFunction ID | SubFunction Name | SubFunction Kind |
  |-------------|---------------|---------------|----------------|------------------|------------------|
  | abc123      | Receive       | FUNCTION      |                |                  |                  |
  |             |               |               | def456         | Receive image    | FUNCTION         |
  |             |               |               | ghi789         | Receive planning | FUNCTION         |
  | jkl012      | Transmit      | FUNCTION      |                |                  |                  |

- Rows with a Function ID start a new top-level action def.
- Rows with only a SubFunction ID are subfunctions of the preceding top-level function.
- Duplicate function names (same PascalCase result) are disambiguated by appending _2, _3, etc.

Usage:
  python import_functions_from_excel.py <input.xlsx|input.csv> [output.sysml] [PackageName]

Requirements:
  pip install openpyxl
"""

import csv
import pathlib
import re
import sys
from dataclasses import dataclass, field

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
class FunctionNode:
    name: str
    id: str = ""
    kind: str = "FUNCTION"
    children: list["FunctionNode"] = field(default_factory=list)


# ---------------------------------------------------------------------------
# Name conversion  (identical rules to the parts import script)
# ---------------------------------------------------------------------------

def to_type_name(name: str) -> str:
    """
    PascalCase identifier for an action def, preserving ALL-CAPS abbreviations.

    Examples:
      "Receive mission status"       -> "ReceiveMissionStatus"
      "CODE - Select companies"      -> "CODESelectCompanies"
      "Number of bitflips"           -> "NumberOfBitflips"
      "Place/keep satellite in mode" -> "PlaceKeepSatelliteInMode"
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


def to_usage_name(name: str) -> str:
    """
    camelCase identifier for an action usage.
    Initial ALL-CAPS abbreviations are lowercased as a group.

    Examples:
      "Receive mission status" -> "receiveMissionStatus"
      "EPS"                    -> "eps"
      "CODE - test 1"          -> "cODETest1"   (CODE treated as abbreviation)
    """
    type_name = to_type_name(name)
    if not type_name:
        return name

    n = len(type_name)
    end_prefix = 0
    for i in range(n):
        if type_name[i].isupper():
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

def _detect_id_name_pairs(header: tuple) -> list[tuple[int, int]]:
    """
    Scan the header row and return (id_col, name_col) index pairs, one per level.
    Works regardless of extra columns (Kind, Description, …) between pairs.
    """
    h = [str(c).lower().strip() if c else "" for c in header]
    pairs: list[tuple[int, int]] = []
    for id_col, v in enumerate(h):
        if "id" in v and v:
            for name_col in range(id_col + 1, len(h)):
                if "name" in h[name_col]:
                    pairs.append((id_col, name_col))
                    break
    return pairs


def _detect_kind_col(header: tuple, id_col: int) -> int:
    """Return the column index of the Kind cell for a given level, or -1 if not found."""
    h = [str(c).lower().strip() if c else "" for c in header]
    for col in range(id_col + 1, min(id_col + 4, len(h))):
        if "kind" in h[col] or "type" in h[col]:
            return col
    return -1


def _parse_rows(rows: list[tuple]) -> list[FunctionNode]:
    """
    Build a FunctionNode tree from the row data.

    The first row is the header. Each data row carries information at exactly
    one hierarchy level (identified by which ID/Name pair is filled).
    """
    if not rows:
        return []

    header = rows[0]
    level_cols = _detect_id_name_pairs(header)
    if not level_cols:
        print("Warning: could not detect ID/Name column pairs from header.", file=sys.stderr)
        print(f"  Header: {header}", file=sys.stderr)
        return []

    # Find Kind columns for each level
    kind_cols = [_detect_kind_col(header, id_col) for id_col, _ in level_cols]

    data_rows = rows[1:]
    roots: list[FunctionNode] = []
    current_at_level: dict[int, FunctionNode] = {}

    for row in data_rows:
        row = list(row) + [None] * (len(level_cols) * 4)

        for level, (col_id, col_name) in enumerate(level_cols):
            cell_id = row[col_id]
            cell_name = row[col_name]

            if cell_id and cell_name:
                kind_col = kind_cols[level]
                kind = str(row[kind_col]).upper() if kind_col >= 0 and row[kind_col] else "FUNCTION"

                node = FunctionNode(
                    name=str(cell_name).strip(),
                    id=str(cell_id).strip(),
                    kind=kind,
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


def read_excel(path: pathlib.Path) -> list[FunctionNode]:
    wb = openpyxl.load_workbook(path, data_only=True)
    ws = wb.active
    return _parse_rows(list(ws.iter_rows(values_only=True)))


def read_csv(path: pathlib.Path) -> list[FunctionNode]:
    sample = path.read_text(encoding="utf-8-sig")[:2048]
    delimiter = ";" if sample.count(";") > sample.count(",") else ","
    with path.open(encoding="utf-8-sig") as f:
        rows = [tuple(row) for row in csv.reader(f, delimiter=delimiter)]
    return _parse_rows(rows)


def load_functions(path: pathlib.Path) -> list[FunctionNode]:
    suffix = path.suffix.lower()
    if suffix in (".xlsx", ".xlsm", ".xls"):
        return read_excel(path)
    elif suffix in (".csv", ".tsv"):
        return read_csv(path)
    try:
        return read_excel(path)
    except Exception:
        return read_csv(path)


# ---------------------------------------------------------------------------
# Deduplication
# ---------------------------------------------------------------------------

def _deduplicate_names(nodes: list[FunctionNode]) -> None:
    """
    Walk the full tree and rename any action def whose PascalCase name collides
    with a previously seen name by appending _2, _3, etc.

    This is an in-place operation; it modifies node.name directly so that
    to_type_name(node.name) yields a unique identifier.
    """
    seen: dict[str, int] = {}  # canonical_name -> count of occurrences so far

    def walk(node: FunctionNode) -> None:
        tname = to_type_name(node.name)
        if tname in seen:
            seen[tname] += 1
            node.name = node.name + f" {seen[tname]}"   # append number to raw name
        else:
            seen[tname] = 1
        for child in node.children:
            walk(child)

    for root in nodes:
        walk(root)


# ---------------------------------------------------------------------------
# SysML v2 code generation
# ---------------------------------------------------------------------------

def _collect_canonical(nodes: list[FunctionNode]) -> dict[str, FunctionNode]:
    """type_name -> canonical FunctionNode (prefer richer/with-children version)."""
    canonical: dict[str, FunctionNode] = {}

    def walk(node: FunctionNode) -> None:
        tname = to_type_name(node.name)
        if tname not in canonical:
            canonical[tname] = node
        elif node.children and not canonical[tname].children:
            canonical[tname] = node
        for child in node.children:
            walk(child)

    for root in nodes:
        walk(root)
    return canonical


def generate_sysml(functions: list[FunctionNode], package_name: str = "Functions") -> str:
    """
    Produce a SysML v2 package with action defs.

    Every action def is emitted in block form so the Excel UUID can be stored
    as a doc comment in the body:

        action def TypeName {
            /* ID: uuid */
        }

        action def ParentName {
            /* ID: uuid */
            action subUsage : SubType;
        }
        action def SubType {
            /* ID: uuid */
        }

    Output order mirrors input order; each parent is followed immediately by
    its children's defs (same convention as the handwritten Functions.sysml).
    """
    canonical = _collect_canonical(functions)
    emitted: set[str] = set()
    lines: list[str] = [f"package {package_name} {{", ""]

    def emit(node: FunctionNode) -> None:
        tname = to_type_name(node.name)
        if tname in emitted:
            return
        emitted.add(tname)

        cn = canonical[tname]
        lines.append(f"{INDENT}action def {tname} {{")
        if cn.id:
            lines.append(f"{INDENT * 2}/* ID: {cn.id} */")
        for child in cn.children:
            child_type = to_type_name(child.name)
            child_usage = to_usage_name(child.name)
            lines.append(f"{INDENT * 2}action {child_usage} : {child_type};")
        lines.append(f"{INDENT}}}")
        lines.append("")

        for child in cn.children:
            emit(child)

    for root in functions:
        emit(root)

    lines.append("}")
    return "\n".join(lines)


# ---------------------------------------------------------------------------
# Validation
# ---------------------------------------------------------------------------

def validate(path: pathlib.Path) -> bool:
    try:
        import syside
        _, diagnostics = syside.load_model([path])
        if diagnostics.contains_errors():
            print("Validation errors:")
            for d in diagnostics:
                print(f"  {d}")
            return False
        print("Validation passed (no errors).")
        return True
    except Exception as exc:
        print(f"Could not validate with syside: {exc}")
        return False


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def main() -> None:
    # -----------------------------------------------------------------------
    # Configure paths here when running directly (without command-line args)
    # Paths are relative to this script's location (DVS/scripts/).
    # -----------------------------------------------------------------------
    _DVS_DIR        = pathlib.Path(__file__).parent.parent
    DEFAULT_INPUT   = _DVS_DIR / "data" / "DVS_Logical_Functions.xlsx"
    DEFAULT_OUTPUT  = _DVS_DIR / "Functions_generated.sysml"
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
    functions = load_functions(input_path)

    if not functions:
        print("No functions found in the input file. Check the column layout.", file=sys.stderr)
        sys.exit(1)

    _deduplicate_names(functions)

    total = sum(1 for _ in _collect_canonical(functions))
    parents = sum(1 for n in _collect_canonical(functions).values() if n.children)
    print(f"Found:    {len(functions)} top-level functions, {total} unique action defs ({parents} with subfunctions)")

    sysml = generate_sysml(functions, package_name)

    output_path.write_text(sysml, encoding="utf-8")
    print(f"Written:  {output_path}")

    validate(output_path)


if __name__ == "__main__":
    main()
