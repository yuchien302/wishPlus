class WishPlus.Views.StoryShow.Chat extends Backbone.View

  template: JST['stories/show/chat']
  tagName: 'li'
  className: 'message'

  events:
    'click .remove_message': 'removeMessage'

  initialize: ->
    @model.on('change', @render, this)
    @model.on('destroy', @close, this)


  render: ->
    $(@el).html(@template(chat: @model))
    $(@el).append(@model.get('message'))
    this

  removeMessage: (e) ->
    e.preventDefault()
    @model.destroy()
  
  close: ->
    this.remove()
    this.unbind()
    this.model.unbind("change", this.modelChanged)
