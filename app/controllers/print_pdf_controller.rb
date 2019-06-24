# frozen_string_literal: true

class PrintPdfController < ApplicationController
  def print
    respond_to do |format|
      format.html
      p format
      format.pdf do
        p "fff"
        render pdf: "file_name" # Excluding ".pdf" extension.
      end
    end
  end
end
