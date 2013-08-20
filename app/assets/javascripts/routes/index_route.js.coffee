App.IndexRoute = Ember.Route.extend
  model: ->
    App.Conversion.find({})
  setupController: (controller,model) ->
    @controllerFor('chart').set 'content', model