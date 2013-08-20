App.IndexController = Ember.ObjectController.extend
  waitingForInput: true
  needs: ["chart"]
  currencies: ["USD","EUR", "GBP", "CHF"]
  resultData: null
  currencyFrom: null
  currencyTo: null
  amount: null
  

  getConversion: ( ->
    if @get('content.amount')? and @get('content.currency_from')? and @get('content.result')?
      "#{@get('content.amount')} #{@get('content.currency_from')} = #{@get('content.result')}" 
  ).property('content')

  convert: ->
    unless @get("amount")? 
      @set("amount", 1)
    unless @get("currencyFrom")? 
      @set("currencyFrom", "USD")
    unless @get("currencyTo")? 
      @set("currencyTo", "EUR")

    @set 'waitingForInput', false

    args = 
      currency_from:@get("currencyFrom"), currency_to: @get("currencyTo"), amount: @get("amount")
    
    jQuery.getJSON '/conversion', args, (data) =>
      @set 'content', App.Conversion.createRecord(data.conversions[0])
      App.Conversion.find({currency_from:@get("currencyFrom")}).then (content) =>
        @set "controllers.chart.content", content
