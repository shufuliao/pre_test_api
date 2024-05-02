require 'rails_helper'

RSpec.describe CurrencyExchangeService do
  let(:rates) do
    {
      'TWD' => {
        'TWD' => 1,
        'JPY' => 3.669,
        'USD' => 0.03281
      },
      'JPY' => {
        'TWD' => 0.26956,
        'JPY' => 1,
        'USD' => 0.00885
      },
      'USD' => {
        'TWD' => 30.444,
        'JPY' => 111.801,
        'USD' => 1
      }
    }
  end
  let(:service) { CurrencyExchangeService.new(currencies: rates) }

  it 'converts amount from source to target currency' do
    result = service.convert('USD', 'JPY', '1,525')
    expect(result).to eq({ status: true, amount: '170,496.53' })
  end

  it 'handles amount without comma' do
    result = service.convert('USD', 'JPY', '1,525')
    expect(result).to eq({ status: true, amount: '170,496.53' })
  end

  it 'handles amount with decimal places' do
    result = service.convert('USD', 'JPY', '15.25')
    expect(result).to eq({ status: true, amount: '1,704.97' })
  end

  it 'returns error for invalid source currency' do
    result = service.convert('INVALID', 'JPY', '1525')
    expect(result).to eq({ status: false, error: 'Invalid source currency' })
  end

  it 'returns error for invalid target currency' do
    result = service.convert('USD', 'INVALID', '1525')
    expect(result).to eq({ status: false, error: 'Invalid target currency' })
  end

  it 'returns error for invalid amount' do
    result = service.convert('USD', 'JPY', 'INVALID')
    expect(result).to eq({ status: false, error: 'Invalid amount' })
  end
end
