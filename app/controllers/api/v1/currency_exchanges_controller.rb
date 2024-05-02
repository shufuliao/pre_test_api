class Api::V1::CurrencyExchangesController < ApplicationController
  def convert
    service = CurrencyExchangeService.new(currencies:)
    amount = params[:amount]

    result = service.convert(params[:source], params[:target], amount)

    render json: { msg: 'success', amount: result }
  rescue StandardError => e
    render json: { msg: 'error', error: e.message }, status: :bad_request
  end

  private

  def currencies
    {
      'TWD' => { 'TWD' => 1, 'JPY' => 3.669, 'USD' => 0.03281 },
      'JPY' => { 'TWD' => 0.26956, 'JPY' => 1, 'USD' => 0.00885 },
      'USD' => { 'TWD' => 30.444, 'JPY' => 111.801, 'USD' => 1 }
    }
  end
end
