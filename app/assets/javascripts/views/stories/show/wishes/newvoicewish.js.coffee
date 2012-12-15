class WishPlus.Views.StoryShow.NewVoiceWish extends Backbone.View

  template: JST['stories/show/wishes/newvoicewish']

  events:
    'click #submit_new_voicewish': 'submitVoiceWish'


  # initialize: ->


  submitVoiceWish: (e) ->
    e.preventDefault()
    console.log "voice!!!"
        


  render: ->
    $(@el).html(@template())
    this

