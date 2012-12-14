class WishPlus.Views.UserShow extends Backbone.View

  template: JST['users/show']

  events:
    'click #create_story': 'createStory'



  initialize: ->

  render: ->
    $(@el).html(@template())
    this

  createStory: ->
    FB.api '/me/friends', (friendlist) ->
      friendlist["data"].forEach (friend) ->
        $('#new_story_star').append('<option value="'+friend["id"]+'">'+friend["name"]+'</option>');
      $('#new_story_star').chosen()
  

