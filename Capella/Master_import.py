'''
Created on 09 Apr 2026

@author: p.jeukens
'''
# include the necessary files
include('workspace://Python4Capella/simplified_api/capella.py')
if False:
    from simplified_api.capella import *
include('workspace://Python4Capella/Scripts/Independent_of_size/Import_and_delete_functions.py')
# Path names
aird_path = "/small import/small import.aird"
xlsx_path = "/small/results/small_complete_export.xlsx"
# Perform full import
full_import(aird_path, xlsx_path)