class WishPlus.Views.StoryShow.PhotoWish extends Backbone.View

  template: JST['stories/show/wishes/photowish']
  tagName: 'li'

  events:
    'click .remove_wish': 'removeWish'

  initialize: ->
    @model.on('change', @render, this)
    @model.on('destroy', @close, this)


  render: ->
    console.log @model
    $(@el).html(@template(wish: @model))
    this

  removeWish: (e) ->
    e.preventDefault()
    @model.destroy()
  
  close: ->
    this.remove()
    this.unbind()
    this.model.unbind("change", this.modelChanged)
