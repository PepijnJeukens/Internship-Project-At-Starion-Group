import pandas as pd
import os
import glob

json_dir = "JSON files"
json_files = glob.glob(os.path.join(json_dir, "*.json"))

output_excel = "Combined_complete_export.xlsx"
with pd.ExcelWriter(output_excel, engine="openpyxl") as writer:
    for json_file in json_files:
        df = pd.read_json(json_file)

        sheet_name = os.path.splitext(os.path.basename(json_file))[0]

        df.to_excel(writer, sheet_name=sheet_name, index=False)

print(f"All JSON files have been combined into {output_excel}")