class Audiobook.Collections.Stories.Participants extends Backbone.Collection

  model: Audiobook.Models.Story.Participant

  initialize: (options) -> 
    this.story_id = options.story_id
  

  url: ->
    '/api/stories/' + this.story_id + '/participations'

  # fetch: ( options, queryObj ) ->
  #   _url = this.url;
  #   if( queryObj )
  #     this.url = this.url + '?' + $.param( queryObj )

  #   super options
  #   this.url = _url


  hasUser: (params) ->
    has = false
    this.each (p) ->
      has = true if p.get("user")["uid"] == params["uid"]
    has