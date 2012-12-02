class Audiobook.Collections.Stories extends Backbone.Collection

  model: Audiobook.Models.Story
  url: '/api/stories'
