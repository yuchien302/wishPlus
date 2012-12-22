class WishPlus.Routers.Stories extends Backbone.Router
  routes:
    '': 'root'
    'stories/:id': 'show'
    'stories': 'index'
    'users/:id': 'userShow'
    'friends': 'friends'

  initialize: ->
    @stories = new WishPlus.Collections.Stories()
    @stories.fetch({async:false})
    storyNew = new WishPlus.Models.Story()
    @storiesNewView = new WishPlus.Views.StoriesNew({model: storyNew})
    $('#new_story_container').html(@storiesNewView.render().el)

  root: ->
    # alert "ya"

  index: ->
    # view = new WishPlus.Views.StoriesIndex(collection: @collection)
    # $('#container').html(view.render().el)
    # console.log @collection

  show: (id) ->
    # story = new WishPlus.Models.Story({id: id})
    # story.fetch
    #   success: (data) ->
    #     storyView = new WishPlus.Views.StoriesShow({model: data})
    #     $('#container').html(storyView.render().el)
    #     console.log (data.get("name"))
    @storyShowView = new WishPlus.Views.StoryShow({model: @stories.get(id)})
    $('#container').html(@storyShowView.render().el)

  userShow: (id) ->
    @userShowView = new WishPlus.Views.UserShow({collection: @stories})
    $('#container').html(@userShowView.render().el)

    @storiesIndexView = new WishPlus.Views.StoriesIndex({collection: @stories})
    $('#container2').html(@storiesIndexView.render().el)

  friends: ->
    friendsView = new WishPlus.Views.Friends()
    $('#container').html(friendsView.render().el)