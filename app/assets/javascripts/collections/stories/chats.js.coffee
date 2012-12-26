class WishPlus.Collections.Stories.Chats extends Backbone.Collection

  model: WishPlus.Models.Story.Chat

  initialize: (models, options) -> 
    this.story_id = options.story_id
  

  url: ->
    '/api/stories/' + this.story_id + '/chats'

