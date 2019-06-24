# frozen_string_literal: true

class PrintPdfController < ApplicationController
  def print
    pdf = WickedPdf.new.pdf_from_html_file(Rails.root + 'index.html')
    respond_to do |format|
      format.pdf
    end
    send_data pdf, type: 'application/pdf', disposition: 'inline'
  end
end
