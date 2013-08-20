App.ChartView = Ember.View.extend
  templateName: "chart"
  colors: Ember.Object.create()
  
  get_random_color: ->
    "#"+((1<<24)*Math.random()|0).toString(16)

  didInsertElement: ->
    data = @get('controller.content').map (item) =>
      color = @get_random_color();
      item.colour = color;
      @get('colors').set(item.get('currency_from'), color)
      console.log item.get('result')
      {value: parseFloat(item.get('result')), color: color}
    console.log data
    ctx = document.getElementById("chart").getContext("2d");
    new Chart(ctx).PolarArea(data)

  rerenderChart: ( ->
    console.log("should be rerendered", @get("controller.conte") )
    @rerender()
  ).observes('controller.content')