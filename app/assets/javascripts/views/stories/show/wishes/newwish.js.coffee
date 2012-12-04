class WishPlus.Views.StoryShow.NewWish extends Backbone.View

  template: JST['stories/show/wishes/newwish']
  tagName: 'div'
  id: 'new_wish'

  events:
    'click #add_photowish': 'addPhotoWish'
    'click #add_textwish': 'addTextWish'

  # initialize: ->
  #   @model.on('change', @render, this)
  #   @model.on('destroy', @close, this)


  render: ->
    $(@el).html(@template())
    this

  addPhotoWish: (e) ->
    newPhotoWishView = new WishPlus.Views.StoryShow.NewPhotoWish({collection: @collection})
    @$("#add_wish_form").html(newPhotoWishView.render().el)

  addTextWish: (e) ->
    newTextWishView = new WishPlus.Views.StoryShow.NewTextWish({collection: @collection})
    @$("#add_wish_form").html(newTextWishView.render().el)

  removeWish: (e) ->
    e.preventDefault()
    @model.destroy()
  
  close: ->
    this.remove()
    this.unbind()

