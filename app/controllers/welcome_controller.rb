
class WelcomeController < ApplicationController
  def index
    render nothing: true, layout: true
  end

  def conversions
    if params[:currency_from]
      result = CurrencyConverter.new params[:currency_from], ["USD","EUR", "GBP", "CHF"], 1
      render json: {conversions: result.result}
    else
      render json: {conversions: []}
    end
  end

  def conversion
    conversion = CurrencyConverter.new params[:currency_from], params[:currency_to], params[:amount]
    render json: {conversions: [conversion.result]}
  end
end