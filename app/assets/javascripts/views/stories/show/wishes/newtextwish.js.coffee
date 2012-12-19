class WishPlus.Views.StoryShow.NewTextWish extends Backbone.View

  template: JST['stories/show/wishes/newtextwish']

  events:
    'click #submit_new_textwish': 'submitTextWish'


  submitTextWish: (e) ->
    e.preventDefault()
    attributes = 
      description: @$('#new_textwish_description').val()
      type: "Textwish"
      story_id: @collection.story_id
    console.log attributes
    @collection.create attributes,
      wait:true
      success: (story) ->
        $('#create_text_wish_modal').modal('toggle')
      error: (story, msg) ->
        alert "error: " + msg


  render: ->
    $(@el).html(@template())
    this

