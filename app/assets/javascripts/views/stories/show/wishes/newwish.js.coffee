class WishPlus.Views.StoryShow.NewWish extends Backbone.View

  template: JST['stories/show/wishes/newwish']
  tagName: 'div'
  id: 'new_wish'

  events:
    'click #add_photowish': 'addPhotoWish'
    'click #add_textwish': 'addTextWish'
    'click #submit_new_photowish': 'submitPhotoWish'
    'click #submit_new_textwish': 'submitTextWish'

  # initialize: ->
  #   @model.on('change', @render, this)
  #   @model.on('destroy', @close, this)


  render: ->
    $(@el).html(@template())
    this

  addPhotoWish: (e) ->
    @$('#create_photo_wish_modal').modal('toggle')


  submitPhotoWish: (e) ->
    e.preventDefault()
    formData = new FormData($('#add_photowish_form')[0])
    console.log formData
    formData.append('wish[description]', 'lalala')
    formData.append('wish[type]', 'Photowish')

    $.ajax
      url: '/api/stories/' + @collection.story_id + '/wishes',
      type: 'POST',
      data: formData,
      processData: false,
      contentType: false,
      type: 'POST',
      success: (data) ->
        location.reload()


  addTextWish: (e) ->
    @$('#create_text_wish_modal').modal('toggle')

  submitTextWish: (e) ->
    e.preventDefault()
    attributes = 
      description: @$('#new_textwish_description').val()
      type: "Textwish"
      story_id: @collection.story_id
    console.log attributes
    @collection.create attributes,
      wait:true
      success: (story) ->
        # window.location.assign('/stories/' + story.id )
        location.reload()
      error: (story, msg) ->
        alert "error: " + msg


  removeWish: (e) ->
    e.preventDefault()
    @model.destroy()
  
  close: ->
    this.remove()
    this.unbind()

