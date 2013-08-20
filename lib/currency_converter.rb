require 'net/http'
class CurrencyConverter

  attr_reader :result

  def initialize from, to, amount
    @from = from
    @amount = amount
    @result = if to.is_a? Array
      to.delete(from)
      to.map do |currency|
        hash_map(request(currency)[:rhs].to_f, currency)
      end
    elsif to.is_a? String
      hash_map(request(to)[:rhs].to_f, to)
    end
  end

  def request currency
    uri = URI("http://www.google.com/ig/calculator?hl=en&q=#{@amount}#{@from}=?#{currency}")
    res = Net::HTTP.get_response(uri).body
    eval(res)
  end

  def hash_map result, currency
    { currency_from: @from, currency_to: currency, amount: @amount, result: result.round(2)}
  end 

end