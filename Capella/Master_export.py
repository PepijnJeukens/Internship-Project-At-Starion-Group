'''
Created on 08 Apr 2026

@author: p.jeukens
'''
# include needed for the Capella modeller API
include('workspace://Python4Capella/simplified_api/capella.py')
if False:
    from simplified_api.capella import *
# Import the export functions
include('workspace://Python4Capella/Scripts/Independent_of_size/Export_functions.py')
# Path names
aird_path = "/In-Flight Entertainment System/In-Flight Entertainment System.aird"
# Perform full export
full_export(aird_path)