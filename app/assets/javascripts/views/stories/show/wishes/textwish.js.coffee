class WishPlus.Views.StoryShow.TextWish extends Backbone.View

  template: JST['stories/show/wishes/textwish']
  tagName: 'li'

  events:
    'click .remove_wish': 'removeWish'

  initialize: ->
    @model.on('change', @render, this)
    @model.on('destroy', @close, this)


  render: ->
    # console.log @model
    $(@el).html(@template(wish: @model))
    @$('p').html(@model.get('description'))
    @$("h3").text(@model.get('username') + ": " )
    @$("h3").before("<img src='https://graph.facebook.com/" + @model.get('useruid') + "/picture'>")
    this

  removeWish: (e) ->
    e.preventDefault()
    @model.destroy()
  
  close: ->
    this.remove()
    this.unbind()
    this.model.unbind("change", this.modelChanged)

