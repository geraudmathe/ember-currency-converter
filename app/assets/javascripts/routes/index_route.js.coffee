App.IndexRoute = Ember.Route.extend
  model: ->
    App.Conversion.createRecord()