class Audiobook.Views.StoriesNew extends Backbone.View

  template: JST['stories/new']
  
  initialize: ->
    # @model.on("reset", @render, this)
    # @collection.on("error", @error, this)

  events:
    'click #new_story': 'newStory'

  render:  ->
    $(@el).html(@template())
    this


  newStory: (e) ->
    e.preventDefault()
    attributes = 
      name: $('#new_story_name').val()
      description: $('#new_story_description').val()
      started_at: $('#new_story_started_at').val()
      ended_at: $('#new_story_ended_at').val()
    @model.save attributes,
      wait:true
      success: (story) ->
        window.location.assign('/stories/' + story.id )
      error: (story, msg) ->
        alert "error: " + msg

