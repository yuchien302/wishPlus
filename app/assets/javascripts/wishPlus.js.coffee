window.WishPlus =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    window.WishPlusApp =  new WishPlus.Routers.Stories()
    Backbone.history.start({pushState: true})

# $(document).ready ->
#   WishPlus.init()
