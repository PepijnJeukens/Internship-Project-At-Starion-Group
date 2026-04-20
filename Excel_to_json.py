import pandas as pd

excel_file = "DVS_complete_export.xlsx"
xls = pd.ExcelFile(excel_file)

for sheet_name in xls.sheet_names:
    df = pd.read_excel(excel_file, sheet_name=sheet_name)
    output_filename = f"{sheet_name}.json"
    df.to_json(output_filename, orient="records", indent=4)
    print(f"Exported {sheet_name} to {output_filename}")