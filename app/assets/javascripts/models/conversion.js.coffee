App.Conversion = DS.Model.extend
  currency_from: DS.attr "string"
  currency_to: DS.attr "string"
  amount: DS.attr "number"
  result: DS.attr "number"