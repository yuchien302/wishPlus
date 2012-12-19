class WishPlus.Views.UserShow.Upcomming extends Backbone.View

  template: JST['users/show/upcomming']

  tagName: 'li'

  render: ->
    $(@el).html(@template(friend: @model))
    this
