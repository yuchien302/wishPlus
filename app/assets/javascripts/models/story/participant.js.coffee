class WishPlus.Models.Story.Participant extends Backbone.Model

  # url: ->
  #   '/api/stories/' + this.story_id + '/participations/' + this.id

  initialize: (options)->
    this.story_id = options.story_id

    this.on("change:user", this.parseUser)
    this.parseUser()

  parseUser: ->
    return unless this.get('user')
    @user = this.get('user')



