class WishPlus.Collections.Stories.Wishes extends Backbone.Collection

  # model: WishPlus.Models.Story.Wish
  model: (attrs, options) =>
    # console.log attrs
    switch attrs.type
      when 'Textwish' then new WishPlus.Models.Story.TextWish(attrs, options)
      when 'Photowish' then new WishPlus.Models.Story.PhotoWish(attrs, options)
      # else new WishPlus.Models.Story.Wish(attrs, options)
      else new Backbone.Model

  initialize: (models, options) -> 
    this.story_id = options.story_id
  

  url: ->
    '/api/stories/' + this.story_id + '/wishes'


  # parse: (resp, xhr) ->
  #   _(resp).map (attrs) ->
  #     # console.log attrs.type
  #     switch attrs.type
  #       when 'Textwish' then new WishPlus.Models.Story.TextWish( {story_id: @story_id}, attrs)
  #       when 'Photowish' then new WishPlus.Models.Story.PhotoWish( {story_id: @story_id}, attrs)


  # fetch: ( options, queryObj ) ->
  #   _url = this.url;
  #   if( queryObj )
  #     this.url = this.url + '?' + $.param( queryObj )

  #   super options
  #   this.url = _url
