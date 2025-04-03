import pdfplumber
import zipfile
import csv
import os

script_dir = os.path.dirname(os.path.abspath(__file__))
pdf_path = os.path.join(script_dir, "..", "..", "web-scraping", "attachment1.pdf")

pdf_path = os.path.abspath(pdf_path)
zip_path = "../Teste_Paulo_Cesar.zip"
csv_path = "../procedimentos_saude.csv"

data = []

header = None

with pdfplumber.open(pdf_path) as pdf:
    for page_number in range(2, len(pdf.pages)):
        page = pdf.pages[page_number]
        table= page.extract_table(table_settings={
            "vertical_strategy": "lines",
            "horizontal_strategy": "lines",
            "snap_tolerance": 3,
            "join_tolerance": 3,
        })
        if table and len(table) > 0:
            if header is None:
                header = table[0]
                data.extend(table[1:0])
            else:
                page_data = [row for row in table if row != header]
                data.extend(page_data)

if header is None:
    raise ValueError("Header not found on any page after page 3")

header = [col.strip() if col else "" for col in header]
for i in range(len(header)):
    if header[i] == "OD":
        header[i] = "Seg. Odontológica"
    elif header[i] == "AMB":
        header[i] = "Seg. Ambulatorial"

with open(csv_path, mode="w", newline="", encoding="utf-8") as file:
    writer = csv.writer(file)
    writer.writerow(header)
    for row in data:
        row = row + [""] * (len(header) - len(row)) if len(row) < len(header) else row
        writer.writerow(row)

with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as zipf:
    zipf.write(csv_path)

print(f"Compressed CSV file in {zip_path}")
