##= require ./wish.js.coffee
class WishPlus.Models.Story.FBPhotoWish extends Backbone.Model
  initialize: (attrs, options) ->
    this.story_id = attrs.story_id

  urlRoot: ->
    '/api/stories/' + this.story_id + '/wishes'