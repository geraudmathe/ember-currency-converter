require 'net/http'
class WelcomeController < ApplicationController
  def index
    render nothing: true, layout: true
  end

  def conversion
    uri = URI("http://www.google.com/ig/calculator?hl=en&q=#{params[:amount]}#{params[:currency_from]}=?#{params[:currency_to]}")
    res = Net::HTTP.get_response(uri).body
    json = eval(res)
    #http://www.google.com/ig/calculator?hl=en&q=100USD=?INR

    render json: {conversions: [
      {
        currency_from: 10000,
        currency_to: 10000,
        amount: params[:amount], 
        result: json[:rhs]}
    ]}
  end
end