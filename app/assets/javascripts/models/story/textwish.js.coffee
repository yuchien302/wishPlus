##= require ./wish.js.coffee
class WishPlus.Models.Story.TextWish extends Backbone.Model
  initialize: (attrs, options) ->
    this.story_id = attrs.story_id
  
  urlRoot: ->
    '/api/stories/' + this.story_id + '/wishes'

  validate: (attrs) ->
    if (attrs.description == "")
      return "來些文字祝我生日快樂吧 QQ"
