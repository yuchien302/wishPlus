class WishPlus.Views.StoryShow.NewPhotoWish extends Backbone.View

  template: JST['stories/show/wishes/newphotowish']

  events:
    'click #submit_new_photowish': 'submitPhotoWish'

  # initialize: ->


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
        


  render: ->
    $(@el).html(@template())
    this

