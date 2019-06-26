# frozen_string_literal: true

class PrintPdfController < ApplicationController
  def print
    @ids = [1, 2, 3, 4, 5, 6, 7, 8]
    template_file_path = ERB.new(File.read(Rails.root.to_s + '/app/views/index.html.erb')).result(binding)
    File.open(Rails.root.to_s + '/tmp/index.html', 'w') {|file| file.write(template_file_path)}
    website_path = 'file:////' + Rails.root.to_s + '/tmp/index.html'
    tmp = Tempfile.new("pdf-chrome-puppeteer")
    system("node qr_pdf.js #{Shellwords.escape(website_path)} #{Shellwords.escape(tmp.path)}")
    pdf_data = File.read(tmp.path)
    pdf_filename = "output.pdf"
    send_data(pdf_data, filename: pdf_filename, type: 'application/pdf', disposition: 'inline')
  end
end
