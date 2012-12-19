class WishPlus.Views.StoryShow.VideoWish extends Backbone.View

  template: JST['stories/show/wishes/videowish']
  tagName: 'li'

  events:
    'click .remove_wish': 'removeWish'

  initialize: ->
    @player
    @model.on('change', @render, this)
    @model.on('destroy', @close, this)


  render: ->
    console.log @model
    $(@el).html(@template(wish: @model))
    playername = "#YT-" + @model.get('videoId')
    @player = new YT.Player(@$(playername)[0],
      height: 390
      width: 640
      videoId: @model.get('videoId')
      # events:
        # onError: @loadPlayer
    )
    this



  loadPlayer: =>
    console.log "123"
    # playername = "#YT-" + @model.get('videoId')
    # @player = new YT.Player(@$(playername)[0],
    #   height: 390
    #   width: 640
    #   videoId: @model.get('videoId')
    #   events: {}
    # )


  removeWish: (e) ->
    e.preventDefault()
    @model.destroy()
  
  close: ->
    this.remove()
    this.unbind()
    this.model.unbind("change", this.modelChanged)

