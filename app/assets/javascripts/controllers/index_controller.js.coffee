App.IndexController = Ember.ObjectController.extend
  currencyFrom: null
  currencyTo: null
  currencies: ["USD", "EUR", "GBP", ""]
  resultData: null

  getConversion: ( ->
    console.log @get('content.result')
    "#{@get('content.amount')} #{@get('content.currency_from')} = #{@get('content.result')}" 
  ).property('content')

  convert: ->
    jQuery.getJSON '/conversions', {currency_from:@get("currencyFrom"), currency_to: @get("currencyTo"), amount: 10},  (json) =>
      conversion = json.conversions[0]
      result = App.Conversion.createRecord conversion
      @set 'content', result