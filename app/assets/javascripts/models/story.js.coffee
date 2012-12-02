class WishPlus.Models.Story extends Backbone.Model
  urlRoot: ->
    '/api/stories/'

  # initialize: ->
  #   # this.users = new WishPlus.Collections.Users();
  #   this.on("change:users", this.parseUsers)
  #   this.parseUsers()

  # toJSON: ->
  #   json = _.clone(this.attributes)
  #   json.users = this.users.map (user) ->
  #     { "user_id": user.id }
  #   console.log json
  #   json

  # parseUsers: ->
  #   # delete this.users
  #   # console.log this.get('users')
  #   # this.users = new WishPlus.Collections.Users(this.get('users'))
  #   this.users = new WishPlus.Collections.Users()
  #   this.users.fetch({async:false}, {story_id: this.id})
  

  initialize: ->
    @participants = new WishPlus.Collections.Stories.Participants({story_id: this.id})
    # this.participants.fetch({async:false})

  validate: (attrs) ->
    if (attrs.name == "")
      return "name can't be blank"




