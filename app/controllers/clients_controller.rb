require 'net/http'

class ClientsController < ApplicationController
  before_action :set_invoice, only: %i[store_bahamas_client retrieve_bahamas_client]

  def store_bahamas_client
    @client = Client.find_or_create_by(add_params)

    response = @client
    status = :created
    if @client.valid?
      @invoice.additional_client = @client
      tax_deductions_service
    else
      response = @client.errors.messages
      status = :bad_request
    end

    render json: response, status: status
  end

  def retrieve_bahamas_client
    render json: @invoice.additional_client, status: :ok
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def add_params
    params.require(:fiscal_id)
    params.require(:name)
    params.require(:email)
    params.permit(:fiscal_id, :name, :email)
  end

  def tax_deductions_service
    uri = URI('https://bahamas.gov/register')
    params = {
      invoice: @invoice.id,
      fiscal_id: @client.fiscal_id,
      name: @client.name,
      email: @client.email
    }
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
  end
end
