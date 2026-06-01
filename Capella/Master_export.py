'''
This script will export the full logical architecture layer of your Capella model to Excel.
For it to work you only have to specify the aird path of your Capella model that you with to export.
An Excel file in a results folder will be created automatically for you in your Capella directory that contains all information. 
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