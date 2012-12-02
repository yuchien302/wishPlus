class Audiobook.Routers.Stories extends Backbone.Router
  routes:
    '': 'root'
    'stories/:id': 'show'
    'stories': 'index'
    'users/:id': 'userShow'

  initialize: ->
    @stories = new Audiobook.Collections.Stories()
    @stories.fetch({async:false})
    storyNew = new Audiobook.Models.Story()
    @storiesNewView = new Audiobook.Views.StoriesNew({model: storyNew})
    $('#new_story_container').html(@storiesNewView.render().el)

  root: ->
    alert "ya"

  index: ->
    # view = new Audiobook.Views.StoriesIndex(collection: @collection)
    # $('#container').html(view.render().el)
    # console.log @collection

  show: (id) ->
    # story = new Audiobook.Models.Story({id: id})
    # story.fetch
    #   success: (data) ->
    #     storyView = new Audiobook.Views.StoriesShow({model: data})
    #     $('#container').html(storyView.render().el)
    #     console.log (data.get("name"))
    @storyShowView = new Audiobook.Views.StoryShow({model: @stories.get(id)})
    $('#container').html(@storyShowView.render().el)

  userShow: (id) ->
    alert "in user" + id