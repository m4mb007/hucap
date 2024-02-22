class PdfController < ApplicationController
# app/controllers/pdf_controller.rb


def print_details
    @participant = Participant.find(params[:id])
    render layout: false
  end
end