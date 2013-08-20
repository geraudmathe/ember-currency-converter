App.ChartController = Ember.ArrayController.extend
  
  contentUpdate: ( ->
    console.log @get "content"
  ).observes "content"

  updateIt: (content) ->
    console.log @get("content")
    @set "content", content
    console.log @get("content")