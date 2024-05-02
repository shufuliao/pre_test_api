class CurrencyExchangeService
  include ActionView::Helpers::NumberHelper

  def initialize(currencies:)
    @currencies = currencies
  end

  def convert(from, target, amount)
    return { status: false, error: 'Invalid source currency' } unless @currencies.key?(from)
    return { status: false, error: 'Invalid target currency' } unless @currencies[from].key?(target)
    return { status: false, error: 'Invalid amount' } unless valid_number?(amount)
    amount = amount.delete(',')

    result = amount.to_f * @currencies[from][target]
    { status: true, amount: number_with_delimiter(result.round(2)) }
  end

  private

  def valid_number?(str)
    if str =~ /^\d{1,3}(,\d{3})*(\.\d+)?$/ && Float(str.delete(','))
      true
    else
      false
    end
  end
end
