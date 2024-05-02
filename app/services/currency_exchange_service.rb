class CurrencyExchangeService
  include ActionView::Helpers::NumberHelper

  def initialize(currencies:)
    @currencies = currencies
  end

  def convert(from, target, amount)
    result = amount.to_f * @currencies[from][target]
    number_with_delimiter(result.round(2))
  end
end
