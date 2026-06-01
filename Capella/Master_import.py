'''
This script can import a full model into Capella. To do this the file paths of the excel and aird path of the Capella model where the excel will be imported to have to be specified.
Depending on if you want unused features to be deleted or not when importing the model into Capella you have to change the include of the full import. If you want unused elements 
to be deleted use Import_and_delete_functions.py, if you do not want unused element to be deleted use Import_functions.py.
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