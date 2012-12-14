class WishPlus.Models.Story extends Backbone.Model
  urlRoot: ->
    '/api/stories/'
  

  initialize: ->

    @participants = new WishPlus.Collections.Stories.Participants({}, {story_id: this.id})
    @wishes = new WishPlus.Collections.Stories.Wishes({}, {story_id: this.id})
    # this.participants.fetch({async:false})


  validate: (attrs) ->
    if (attrs.star_uid == "")
      return "沒有壽星QQ"




