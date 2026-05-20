#!/usr/bin/env python3
"""
master_import.py
Run the full sysml v2 import pipeline from a single multi-sheet Excel workbook.

Customize the variables in the USER CONFIGURATION section below, then run:
  python master_import.py
"""

import pathlib
from import_functions import full_import

# ---------------------------------------------------------------------------
# USER CONFIGURATION
# Edit these variables to match your file paths.
# Paths are relative to the this script's parent folder,
# so the script works correctly regardless of where it is run from.
# it expects the following structure:
# project_name/ -sysml files
#             / scripts / master import and import functions script
#             / data / to be imported excel files
# ---------------------------------------------------------------------------

_FOLDER_DIR = pathlib.Path(__file__).parent#.parent

# Path to the Excel workbook that contains all data sheets.
# Expected worksheets (others are ignored):
#   Systems | Functions | Link Systems and Functions | Functional Exchanges |
#   Component Exchanges | Link Exchanges | Functional Chains
print(_FOLDER_DIR)

EXCEL_FILE_PATH = _FOLDER_DIR / "data" / "DVS_complete_export.xlsx"

# Output SysML filenames (written into the DVS/ directory).
PARTS_SYSML_FILENAME = _FOLDER_DIR / "Master_import_test15_parts.sysml"
FUNCTIONS_SYSML_FILENAME = _FOLDER_DIR / "Master_import_test15_actions.sysml"

# Optional: override the SysML package names.
# Leave as "" to derive the package name automatically from the filename stem.
PARTS_PACKAGE = "Parts15"
FUNCTIONS_PACKAGE = "Actions15"

# ---------------------------------------------------------------------------
# RUN IMPORT
# ---------------------------------------------------------------------------

full_import(
    excel_file=EXCEL_FILE_PATH,
    parts_filename=PARTS_SYSML_FILENAME,
    functions_filename=FUNCTIONS_SYSML_FILENAME,
    parts_package=PARTS_PACKAGE,
    functions_package=FUNCTIONS_PACKAGE,
)
