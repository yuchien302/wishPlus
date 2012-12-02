class Audiobook.Views.StoryShow extends Backbone.View

  template: JST['stories/show']

  events:
    'click #add_participant': 'addParticipant'


  initialize: ->
    # @model.participants.fetch({async:false})
    @model.participants.fetch({async:false})
    @model.participants.on("add", @appendParticipant, this)
    @model.participants.on("reset", @render, this)

  render: ->
    # console.log @model.users
    # @model.users.forEach (user) ->
    #   console.log user.get("name");
    $(@el).html(@template(story: @model))
    @model.participants.each(@appendParticipant)
    this


  appendParticipant: (participant) =>
    console.log participant
    view = new Audiobook.Views.StoryShow.Participant(model: participant)
    @$('#participants').append(view.render().el)
    

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
              unless participants.hasUser({ uid: user["id"] })
                participants.create
                  user:
                    uid: user["id"]
                    name: user["name"]
                    provider: "facebook"


