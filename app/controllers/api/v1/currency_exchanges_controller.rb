class Api::V1::CurrencyExchangesController < ApplicationController
  def convert
    render json: { msg: 'success' }
  rescue StandardError => e
    render json: { msg: 'error', error: e.message }, status: :bad_request
  end
end
