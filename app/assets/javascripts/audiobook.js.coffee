window.Audiobook =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    window.AudiobookApp =  new Audiobook.Routers.Stories()
    Backbone.history.start({pushState: true})

$(document).ready ->
  Audiobook.init()
