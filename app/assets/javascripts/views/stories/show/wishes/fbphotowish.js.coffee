class WishPlus.Views.StoryShow.FBPhotoWish extends Backbone.View

  template: JST['stories/show/wishes/fbphotowish']
  tagName: 'li'
  # className: 'span3'

  events:
    'click .remove_wish': 'removeWish'

  initialize: ->
    @model.on('change', @render, this)
    @model.on('destroy', @close, this)


  render: ->
    self = this
    FB.api '/' + @model.get("pid") + '?fields=source', (res) ->
      $(self.el).html(self.template({wish: res}))
    this

  removeWish: (e) ->
    e.preventDefault()
    @model.destroy()
  
  close: ->
    this.remove()
    this.unbind()
    this.model.unbind("change", this.modelChanged)
