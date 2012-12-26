class WishPlus.Views.StoryShow.NewChat extends Backbone.View

  template: JST['stories/show/newchat']

  events:
    'click #submit_new_chat': 'submitChat'


  submitChat: (e) ->
    e.preventDefault()
    attributes =
      message: @$('#new_message').val().replace(/\n\r?/g, '<br />')
      story_id: @collection.story_id
      username: window.current_user.name
      useruid: window.current_user.id
    @collection.create attributes,
      wait:true
      success: (story) ->
        # $('#create_text_wish_modal').modal('toggle')
      error: (story, msg) ->
        alert "error: " + msg


  render: ->
    $(@el).html(@template())
    this

