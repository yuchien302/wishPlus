class WishPlus.Views.Friends extends Backbone.View

  template: JST['friends']

  events:
    'click #aaa': 'aaa'



  initialize: ->


  aaa: ->
    FB.api '/me/friends', (friendlist) ->
      console.log friendlist
      friendlist["data"].forEach (friend) ->
        $('#friendlist').append('<li>'+friend["name"]+'</li>');


  render: ->
    $(@el).html(@template())
    FB.api '/me/friends', (friendlist) ->
      console.log friendlist
      friendlist["data"].forEach (friend) ->
        $('#friendlist').append('<li>'+friend["name"]+'</li>');
    this

  # createStory: ->
  #   FB.api '/me/friends', (friendlist) ->
  #     friendlist["data"].forEach (friend) ->
  #       $('#new_story_star').append('<option value="'+friend["id"]+'">'+friend["name"]+'</option>');
  #     $('#new_story_star').chosen()
  

