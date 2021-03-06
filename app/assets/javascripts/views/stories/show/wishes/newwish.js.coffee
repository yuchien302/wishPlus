class WishPlus.Views.StoryShow.NewWish extends Backbone.View

  template: JST['stories/show/wishes/newwish']
  tagName: 'div'
  id: 'new_wish'

  events:
    'click #add_photowish': 'addPhotoWish'
    # 'click #add_fbphotowish': 'addFBPhotoWish'
    'click #add_textwish': 'addTextWish'
    'click #add_videowish': 'addVideoWish'

  render: ->
    $(@el).html(@template())
    newTextWishView = new WishPlus.Views.StoryShow.NewTextWish({collection: @collection})
    newPhotoWishView = new WishPlus.Views.StoryShow.NewPhotoWish({collection: @collection})
    # newFBPhotoWishesView = new WishPlus.Views.StoryShow.NewFBPhotoWishes({collection: @collection})
    newVideoWishView = new WishPlus.Views.StoryShow.NewVideoWish({collection: @collection})
    @$('#new_wish_modal').append(newTextWishView.render().el)
    @$('#new_wish_modal').append(newPhotoWishView.render().el)
    # @$('#new_wish_modal').append(newFBPhotoWishesView.render().el)
    @$('#new_wish_modal').append(newVideoWishView.render().el)
    this

  addPhotoWish: (e) ->
    @$('#create_photo_wish_modal').modal('toggle')

  addFBPhotoWish: (e) ->
    console.log "add FBPhoto"

  addTextWish: (e) ->
    @$('#create_text_wish_modal').modal('toggle')

  addVideoWish: (e) =>
    @$('#create_video_wish_modal').modal('toggle')


  removeWish: (e) ->
    e.preventDefault()
    @model.destroy()
  
  close: ->
    this.remove()
    this.unbind()

