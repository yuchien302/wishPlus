class WishPlus.Views.StoriesIndex.Show extends Backbone.View

  template: JST['stories/index/show']
  tagName :'li'
  render: ->
    console.log @model
    $(@el).html(@template(story: @model))
    this