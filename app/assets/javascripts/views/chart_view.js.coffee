App.ChartView = Ember.View.extend
  templateName: "chart"
  colors: Ember.Object.create()
  
  get_random_color: ->
    "#"+((1<<24)*Math.random()|0).toString(16)

  didInsertElement: ->
    data = @get('controller.content').map (item) =>
      color = @get_random_color();
      @get('colors').set(item.get('currency_from'), color)
      {value: item.get('result'), color: color}
    ctx = document.getElementById("chart").getContext("2d");
    console.log "after ctx", data.length
    new Chart(ctx).PolarArea(data)
    #@get "renderChart"

  renderChart: ( ->
    console.log("should be rerendered", @get("controller.conte") )
    @rerender()
  ).observes('controller.content')