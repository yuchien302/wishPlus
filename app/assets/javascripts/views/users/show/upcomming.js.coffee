class WishPlus.Views.UserShow.Upcomming extends Backbone.View

  template: JST['users/show/upcomming']

  tagName: 'div'

  events:
    'click': 'makeWish'

  render: ->
    $(@el).html(@template(friend: @model))
    this


  makeWish: (e) =>
    e.preventDefault()
    @trigger("makeWish", @model)