#!/usr/bin/env python3
"""
master_export.py

Minimal script that runs a full SysML-to-Excel export.

Usage
-----
  1. Edit the three variables in the USER CONFIGURATION section below.
  2. Run:  python master_export.py

Output
------
  DVS/results/<EXCEL_OUTPUT_NAME>_complete_export.xlsx

  Worksheets (in order):
    Systems                    — part hierarchy from the Parts SysML file
    Functions                  — action hierarchy from the Functions SysML file
    Link Systems and Functions — function-to-system allocations
    Functional Exchanges       — functional exchange connections
    Component Exchanges        — component exchange connections
    Link Exchanges             — exchange allocations (CE <-> FE cross-references)
    Functional Chains          — functional chain sequences
    Capabilities               — empty (for manual completion)
"""

from export_functions import full_export

# ---------------------------------------------------------------------------
# USER CONFIGURATION
# Edit these three variables before running the script.
# ---------------------------------------------------------------------------

# Filename of the Parts SysML file (relative to the DVS directory, or absolute path)
PARTS_SYSML_FILENAME = "Master_import_test15_parts.sysml"

# Filename of the Functions SysML file (relative to the DVS directory, or absolute path)
FUNCTIONS_SYSML_FILENAME = "Master_import_test15_actions.sysml"

# Base name for the output Excel file.
# The file will be saved as DVS/results/<EXCEL_OUTPUT_NAME>_complete_export.xlsx
EXCEL_OUTPUT_NAME = "TestExport"

# ---------------------------------------------------------------------------
# RUN EXPORT  — no changes needed below this line
# ---------------------------------------------------------------------------

full_export(
    parts_filename=PARTS_SYSML_FILENAME,
    functions_filename=FUNCTIONS_SYSML_FILENAME,
    excel_name=EXCEL_OUTPUT_NAME,
)
