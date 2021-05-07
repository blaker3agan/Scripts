
from fpdf import FPDF
import os, glob
os.chdir("C:\Test\PDFs")  
arr = os.listdir()
for txtfile in arr:
    with open(txtfile, 'r', encoding="utf-8", errors='ignore') as f:
        pdf = FPDF()   
        pdf.add_page()
        pdf.set_font("Arial", size = 12)
        for x in f:
            pdf.cell(200, 10, txt = x, ln = 1, align = 'L')

        pdf.output(txtfile.replace('.txt', '.pdf'))
        