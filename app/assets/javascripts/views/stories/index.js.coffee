class WishPlus.Views.StoriesIndex extends Backbone.View

  template: JST['stories/index']
  tagName: 'ul'
  className: 'tp-grid'

  render: ->
    $(@el).html(@template())
    @collection.each(@appendStory)
    this


  appendStory: (story) =>
    view = new WishPlus.Views.StoriesIndex.Show(model: story)
    $(@el).append(view.render().el)