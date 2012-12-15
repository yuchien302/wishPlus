class WishPlus.Views.StoryShow extends Backbone.View

  template: JST['stories/show']

  events:
    'click #add_participant': 'addParticipant'

  initialize: ->

    @model.participants.fetch({async:false})
    @model.participants.on("add", @appendParticipant, this)
    @model.participants.on("reset", @render, this)

    @model.wishes.fetch({async:false})
    @model.wishes.on("add", @appendWish, this)
    @model.wishes.on("reset", @render, this)

  render: ->
    
    $(@el).html(@template(story: @model))
    @model.participants.each(@appendParticipant)
    @model.wishes.each(@appendWish)

    newWishView = new WishPlus.Views.StoryShow.NewWish({collection: @model.wishes})
    @$("#new_wish_panel").append(newWishView.render().el)

    this

  appendParticipant: (participant) =>
    # console.log participant
    view = new WishPlus.Views.StoryShow.Participant(model: participant)
    @$('#participants').append(view.render().el)
    
  appendWish: (wish) =>
    # console.log wish.get("type")
    view
    switch wish.get("type")
      when 'Textwish' then view = new WishPlus.Views.StoryShow.TextWish(model: wish)
      when 'Photowish' then view = new WishPlus.Views.StoryShow.PhotoWish(model: wish)
      when 'Videowish' then view = new WishPlus.Views.StoryShow.VideoWish(model: wish)
    @$('#wishes').append(view.render().el)
    if wish.get("type") == "Videowish"
      console.log view
      view.loadPlayer()

  addParticipant: (e) ->
    e.preventDefault()
    participants = @model.participants

    FB.ui
      method: "apprequests"
      message: " should learn more about this awesome site."
      data: "extra data"
    ,(sendlist) ->
      if sendlist? and sendlist.to and sendlist.to.length > 0
        sendlist.to.forEach (uid) ->
          FB.api "/" + uid, (user) ->
            FB.api "/" + uid + "/picture", (user_picture) ->
              console.log user_picture
              unless participants.hasUser({ uid: user["id"] })
                participants.create
                  user:
                    uid: user["id"]
                    name: user["name"]
                    picture: user_picture.data.url
                    provider: "facebook"

  # addWish: (e) ->
  #   e.preventDefault()
  #   newWishView = new WishPlus.Views.StoryShow.NewWish({collection: @model.wishes})
  #   $(@el).append(newWishView.render().el)



