class WishPlus.Views.StoryShow.NewPhotoWish extends Backbone.View

  template: JST['stories/show/wishes/newphotowish']

  events:
    'click #submit_new_photowish': 'submitPhotoWish'


  submitPhotoWish: (e) ->
    e.preventDefault()
    self = this
    formData = new FormData($('#add_photowish_form')[0])
    formData.append('wish[type]', 'Photowish')

    if @$('#new_photowish_remote_url').val() != "" || @$('#new_photowish_photo').val() != ""
      formData.append('wish[remote_photo_url]', @$('#new_photowish_remote_url').val())


      $.ajax
        url: '/api/stories/' + @collection.story_id + '/wishes',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        type: 'POST',
        success: (data) ->
          self.collection.fetch()
          # console.log data.id
          # self.collection.get(data.id).fetch()
          # location.reload()
    @$('#create_photo_wish_modal').modal('toggle')




  render: ->
    $(@el).html(@template())
    newFBPhotoWishesView = new WishPlus.Views.StoryShow.NewFBPhotoWishes({collection: @collection})
    @$('#fbphoto_wish').html(newFBPhotoWishesView.render().el)
    this

