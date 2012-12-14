class WishPlus.Views.StoriesNew extends Backbone.View

  template: JST['stories/new']
  
  initialize: ->
    # @model.on("reset", @render, this)
    # @collection.on("error", @error, this)

  events:
    'click #submit_new_story': 'newStory'
    'change select' : 'selectStar'

  render:  ->
    $(@el).html(@template())
    this

  selectStar: (e) ->

    uid = $('#new_story_star').val()
    self = this
    FB.api '/' + uid + '/picture', (res) ->
      self.picture = res.data.url

    FB.api uid , (res) ->
      console.log res.birthday
      $('#new_story_birthday').val(res.birthday)


  newStory: (e) ->
    e.preventDefault()
    attributes = 
      star_uid: $('#new_story_star').val()
      star_name: $('#new_story_star option:selected').text()
      name: $('#new_story_name').val()
      birthday: $('#new_story_birthday').val()
      picture: @picture
    @model.save attributes,
      wait:true
      success: (story) ->
        window.location.assign('/stories/' + story.id )
      error: (story, msg) ->
        alert "error: " + msg

