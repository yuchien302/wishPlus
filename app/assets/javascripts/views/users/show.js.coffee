class WishPlus.Views.UserShow extends Backbone.View

  template: JST['users/show']

  events:
    # 'click #create_story': 'createStory'
    'click #friends_birthday': 'friends_birthday'



  initialize: ->
    self = this
    @FBfriends = []
    @FBupcomming = []

    FB.api '/me/friends?fields=birthday,id,picture.type(large),name', (friendlist) ->
      friendlist["data"].forEach (friend) ->
        $('#new_story_star').append('<option value="'+friend["id"]+'">'+friend["name"]+'</option>')
        self.FBfriends.push({name:friend["name"], id:friend["id"], birthday:friend["birthday"], picture:friend.picture.data.url})
      $('#new_story_star').chosen()
      self.sortBirthday(friendlist)



  sortBirthday: (friendlist) =>
    @FBfriends.forEach (friend) ->
      if (friend.birthday)
        next_birthday = new Date(friend.birthday)
        today = new Date()

        if ( (next_birthday.getMonth() >= today.getMonth()) && (next_birthday.getDate() > today.getDate() ) )
          next_birthday.setFullYear( today.getFullYear() )
        else
          next_birthday.setFullYear( today.getFullYear()+1 )
        friend.next_birthday = next_birthday
      else 
        no_birthday = new Date("2112/12/21")
        friend.next_birthday = no_birthday

    @FBfriends.sort (a, b)->
      a.next_birthday - b.next_birthday


  render: ->
    $(@el).html(@template())
    this


  
  friends_birthday: ->
    @FBfriends.forEach (friend) ->
      # console.log friend.picture
      view = new WishPlus.Views.UserShow.Upcomming(model: friend)
      $('#friendlist').append(view.render().el)
      # $('#friendlist').append('<li>' + friend["name"] + '<img src="#"'  + '/></li>')



