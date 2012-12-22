class WishPlus.Views.StoryShow.NewVideoWish extends Backbone.View

  template: JST['stories/show/wishes/newvideowish']

  events:
    'click #submit_new_videowish': 'submitVideoWish'
    'show #create_video_wish_modal':'loadWidget'

  initialize: ->
    @widget

  loadWidget: ->
    @$('#widget').html("<img src='/assets/loading.gif'>")
    @widget = new YT.UploadWidget( "widget",
      width: 500
      events:
        onUploadSuccess: @onUploadSuccess
        onProcessingComplete: @onProcessingComplete
    )

  submitVideoWish: (e) ->
    e.preventDefault()
    console.log "video!!!"
        
  render: ->
    $(@el).html(@template())
    this

  onUploadSuccess: (event) =>
    self = this
    console.log "uploaded"
    # alert "Video ID " + event.data.videoId + " was uploaded and is currently being processed."
    attributes = 
      videoId: event.data.videoId
      type: "Videowish"
      story_id: @collection.story_id
    @collection.create attributes,
      wait:true
      success: (story) ->
        # window.location.assign('/stories/' + story.id )
        self.id = story.id
        @$('#create_video_wish_modal').modal('toggle')
        # location.reload()

      error: (story, msg) ->
        alert "error: " + msg


  onProcessingComplete: (event) =>
    @collection.get(@id).fetch()
    # @collection.fetch()
    # $(@el).html(@template())
    # attributes = 
    #   videoId: event.data.videoId
    #   type: "Videowish"
    #   story_id: @collection.story_id
    # @collection.create attributes,
    #   wait:true
    #   success: (story) ->
    #     # window.location.assign('/stories/' + story.id )
    #     location.reload()
    #   error: (story, msg) ->
    #     alert "error: " + msg


    # @player = new YT.Player("player",
    #   height: 390
    #   width: 640
    #   videoId: event.data.videoId
    #   events: {}
    # )
