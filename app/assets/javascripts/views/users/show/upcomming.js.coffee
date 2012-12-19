class WishPlus.Views.UserShow.Upcomming extends Backbone.View

  template: JST['users/show/upcomming']

  tagName: 'div'

  render: ->
    $(@el).html(@template(friend: @model))
    this
