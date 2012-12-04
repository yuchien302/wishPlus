class WishPlus.Views.StoriesNew extends Backbone.View

  template: JST['stories/new']
  
  initialize: ->
    # @model.on("reset", @render, this)
    # @collection.on("error", @error, this)

  events:
    'click #submit_new_story': 'newStory'

  render:  ->
    $(@el).html(@template())
    this


  newStory: (e) ->
    e.preventDefault()
    attributes = 
      name: $('#new_story_name').val()
      birthday: $('#new_story_birthday').val()
    @model.save attributes,
      wait:true
      success: (story) ->
        window.location.assign('/stories/' + story.id )
      error: (story, msg) ->
        alert "error: " + msg

