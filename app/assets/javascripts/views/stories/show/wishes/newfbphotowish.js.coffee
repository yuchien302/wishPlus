class WishPlus.Views.StoryShow.NewFBPhotoWish extends Backbone.View

  template: JST['stories/show/wishes/newfbphotowish']
  tagName: 'span'

  events:
    'click img': 'selectPhoto'

  initialize: (options)->
    @wishes = options.collection


  selectPhoto: (e) ->
    e.preventDefault()
    console.log @wishes
    attributes = 
      pid: @model.id
      type: "Fbphotowish"
      story_id: @wishes.story_id
    @wishes.create attributes,
      wait:true
      success: (story) ->
        # window.location.assign('/stories/' + story.id )
        # location.reload()
      error: (story, msg) ->
        alert "error: " + msg

  render: ->
    console.log @model
    $(@el).html(@template(photo: @model))
    this

  close: =>
    this.remove()
    this.unbind()
