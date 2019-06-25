# frozen_string_literal: true

class PrintPdfController < ApplicationController
  def print
    website_path = ' file:////home/ggku3sys114/RubymineProjects/PdfPrintTesting/index.html'
    tmp = Tempfile.new("pdf-chrome-puppeteer")
    system("node qr_pdf.js #{Shellwords.escape(website_path)} #{Shellwords.escape(tmp.path)}")
    pdf_data = File.read(tmp.path)
    pdf_filename = "output.pdf"
    send_data(pdf_data, filename: pdf_filename, type: 'application/pdf', disposition: 'inline')
  end
end
