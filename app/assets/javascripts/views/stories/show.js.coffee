class WishPlus.Views.StoryShow extends Backbone.View

  template: JST['stories/show']

  events:
    'click #add_participant': 'addParticipant'
    'click button#add_wish': 'addWish'


  initialize: ->
    @paper = Raphael('card', 940, 400)

    @model.participants.fetch({async:false})
    @model.participants.on("add", @appendParticipant, this)
    @model.participants.on("reset", @render, this)

    @model.wishes.fetch({async:false})
    @model.wishes.on("add", @appendWish, this)
    @model.wishes.on("reset", @render, this)

  render: ->
    
    dot = @paper.circle(470, 40, 20)
    text = @paper.text(50, 50, "Raphaël\nkicks\nbutt!").rotate(-25,50,50)
    text.node.style.cursor = 'move'

    start = ->
      text.oBB = text.getBBox()

    move = (dx, dy) ->
      bb = text.getBBox()
      text.translate(text.oBB.x - bb.x + dx, text.oBB.y - bb.y + dy)
    
    up = ->
      console.log "123"

    text.drag(move, start, up)      



    $(@el).html(@template(story: @model))
    @model.participants.each(@appendParticipant)
    @model.wishes.each(@appendWish)

    newWishView = new WishPlus.Views.StoryShow.NewWish({collection: @model.wishes})
    @$("#new_wish_panel").append(newWishView.render().el)

    this
    
  handle: (delta) ->
    vBHo = viewBoxHeight
    vBWo = viewBoxWidth
    if delta < 0
      viewBoxWidth *= 0.95
      viewBoxHeight *= 0.95
    else
      viewBoxWidth *= 1.05
      viewBoxHeight *= 1.05
    viewBox.X -= (viewBoxWidth - vBWo) / 2
    viewBox.Y -= (viewBoxHeight - vBHo) / 2
    @paper.setViewBox viewBox.X, viewBox.Y, viewBoxWidth, viewBoxHeight

  wheel: (event) ->
    delta = 0
    event = parent.window.event  unless event
    if event.wheelDelta # IE/Opera.
      delta = event.wheelDelta / 120  
    else delta = -event.detail / 3  if event.detail

    handle delta  if delta

    event.preventDefault()  if event.preventDefault
    event.returnValue = false

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
    @$('#wishes').append(view.render().el)

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

  addWish: (e) ->
    e.preventDefault()
    newWishView = new WishPlus.Views.StoryShow.NewWish({collection: @model.wishes})
    $(@el).append(newWishView.render().el)



