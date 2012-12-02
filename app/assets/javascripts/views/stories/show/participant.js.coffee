class Audiobook.Views.StoryShow.Participant extends Backbone.View

  template: JST['stories/show/participant']
  tagName: 'li'

  events:
    'click .remove_participant': 'removeParticipant'

  initialize: ->
    @model.on('change', @render, this)
    @model.on('destroy', @close, this)


  render: ->
    $(@el).html(@template(participant: @model))
    this

  removeParticipant: (e) ->
    e.preventDefault()
    @model.destroy()
  
  close: ->
    this.remove()
    this.unbind()
    this.model.unbind("change", this.modelChanged)
