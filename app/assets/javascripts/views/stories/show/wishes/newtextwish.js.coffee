class WishPlus.Views.StoryShow.NewTextWish extends Backbone.View

  template: JST['stories/show/wishes/newtextwish']
  tagName: 'li'
  # id: 'new_wish'

  events:
    'click #submit_new_textwish': 'newTextWish'
    'focus' : 'BBB'

  BBB: (e) ->
    alert "byebye"
  # initialize: ->
  #   @model.on('change', @render, this)
  #   @model.on('destroy', @close, this)

  newTextWish: (e) ->
    e.preventDefault()
    attributes = 
      description: $('#new_textwish_description').val()
      type: "Textwish"
      story_id: @collection.story_id
    console.log attributes
    @collection.create attributes,
      wait:true
      success: (story) ->
        # window.location.assign('/stories/' + story.id )
        console.log "success"
      error: (story, msg) ->
        alert "error: " + msg


  render: ->
    $(@el).html(@template())
    this

  # removeWish: (e) ->
  #   e.preventDefault()
  #   @model.destroy()
  
  # close: ->
  #   this.remove()
  #   this.unbind()
  #   this.model.unbind("change", this.modelChanged)
