class WishPlus.Views.StoryShow.NewFBPhotoWishes extends Backbone.View

  template: JST['stories/show/wishes/newfbphotowishes']

  events:
    # 'click #submit_new_fbphotowish': 'submitFBPhotoWish'
    'change select' : 'selectAlbum'
    'click #fbphoto_surprise' : 'surprise'
    'click #fbphoto_you_and_star' : 'youAndStar'
    'click #fbphoto_star_and_you' : 'starAndYou'
    'click #fbphoto_star_you' : 'starYou'

  # submitFBPhotoWish: (e) ->
  #   e.preventDefault()
  #   console.log "submitFBPhotoWish"
    # attributes = 
    #   description: @$('#new_textwish_description').val()
    #   type: "Textwish"
    #   story_id: @collection.story_id
    # console.log attributes
    # @collection.create attributes,
    #   wait:true
    #   success: (story) ->
    #     # window.location.assign('/stories/' + story.id )
    #     # location.reload()
    #   error: (story, msg) ->
    #     alert "error: " + msg

    # query: 'select caption,src_big, object_id from photo where (  (pid in (select pid from photo_tag where subject=me())) AND owner = 100002265879390 )'

#     select object_id from photo where ( object_id in (select object_id from photo_tag where subject=me()) ) AND
# object_id in (select object_id from photo where ( object_id in (select object_id from photo_tag where subject=100000221666201) )
# )

    # select object_id from photo where ( object_id in (select object_id from photo_tag where subject=me()) ) AND object_id in (select object_id from photo where ( object_id in (select object_id from photo_tag where subject = 100000221666201) ))

  surprise: (e)->
    e.preventDefault()
    starid = $('#story_star').data("starid")
    self = this
    $('#fb_preview').html('<img src="/assets/loading.gif"/>')
    FB.api 
      method: 'fql.query'
      query: 'select caption,src_small, object_id from photo where ( object_id in (select object_id from photo_tag where subject=me()) ) AND object_id in (select object_id from photo where ( object_id in (select object_id from photo_tag where subject = ' + starid + ') ))' 
    , (res) ->
      $('#fb_preview').html('')
      $('#fb_preview').text('no photos QAQ') unless res
      res.forEach (fqlphoto) ->
        photo = { id: fqlphoto.object_id, picture: fqlphoto.src_small}
        view = new WishPlus.Views.StoryShow.NewFBPhotoWish({model:photo, collection: self.collection})
        $('#fb_preview').append(view.render().el)
      # $('#fb_preview li').hoverdir()


    $('#fb_preview2').html('<img src="/assets/loading.gif"/>')
    FB.api 
      method: 'fql.query'
      query: 'select caption,src_small, object_id from photo where (  (pid in (select pid from photo_tag where subject= ' + starid + ')) AND owner = me() )'
    , (res) ->
      $('#fb_preview2').html('')
      # $('#fb_preview2').text('no photos QAQ') unless res
      res.forEach (fqlphoto) ->
        photo = { id: fqlphoto.object_id, picture: fqlphoto.src_small}
        view = new WishPlus.Views.StoryShow.NewFBPhotoWish({model:photo, collection: self.collection})
        $('#fb_preview2').append(view.render().el)


    $('#fb_preview3').html('<img src="/assets/loading.gif"/>')
    FB.api 
      method: 'fql.query'
      query: 'select caption,src_small, object_id from photo where (  (pid in (select pid from photo_tag where subject=me() )) AND owner = ' + starid + ')'
    , (res) ->
      $('#fb_preview3').html('')
      # $('#fb_preview3').text('no photos QAQ') unless res
      res.forEach (fqlphoto) ->
        photo = { id: fqlphoto.object_id, picture: fqlphoto.src_small}
        view = new WishPlus.Views.StoryShow.NewFBPhotoWish({model:photo, collection: self.collection})
        $('#fb_preview3').append(view.render().el)





  starYou: ->
    # console.log "star+you"
    starid = $('#story_star').data("starid")
    self = this
    $('#fb_preview').html('<img src="/assets/loading.gif"/>')
    FB.api 
      method: 'fql.query'
      query: 'select caption,src_small, object_id from photo where ( object_id in (select object_id from photo_tag where subject=me()) ) AND object_id in (select object_id from photo where ( object_id in (select object_id from photo_tag where subject = ' + starid + ') ))' 
    , (res) ->
      $('#fb_preview').html('')
      $('#fb_preview').text('no photos QAQ') unless res
      res.forEach (fqlphoto) ->
        photo = { id: fqlphoto.object_id, picture: fqlphoto.src_small}
        view = new WishPlus.Views.StoryShow.NewFBPhotoWish({model:photo, collection: self.collection})
        $('#fb_preview').append(view.render().el)


  youAndStar: ->
    # console.log "owner=me"
    starid = $('#story_star').data("starid")
    self = this
    $('#fb_preview').html('<img src="/assets/loading.gif"/>')
    FB.api 
      method: 'fql.query'
      query: 'select caption,src_small, object_id from photo where (  (pid in (select pid from photo_tag where subject= ' + starid + ')) AND owner = me() )'
    , (res) ->
      $('#fb_preview').html('')
      $('#fb_preview').text('no photos QAQ') unless res
      res.forEach (fqlphoto) ->
        photo = { id: fqlphoto.object_id, picture: fqlphoto.src_small}
        view = new WishPlus.Views.StoryShow.NewFBPhotoWish({model:photo, collection: self.collection})
        $('#fb_preview').append(view.render().el)


  starAndYou: ->
    # console.log "owner=star"
    starid = $('#story_star').data("starid")
    self = this
    $('#fb_preview').html('<img src="/assets/loading.gif"/>')
    FB.api 
      method: 'fql.query'
      query: 'select caption,src_small, object_id from photo where (  (pid in (select pid from photo_tag where subject=me() )) AND owner = ' + starid + ')'
    , (res) ->
      $('#fb_preview').html('')
      $('#fb_preview').text('no photos QAQ') unless res
      res.forEach (fqlphoto) ->
        photo = { id: fqlphoto.object_id, picture: fqlphoto.src_small}
        view = new WishPlus.Views.StoryShow.NewFBPhotoWish({model:photo, collection: self.collection})
        $('#fb_preview').append(view.render().el)





  selectAlbum: ->
    self = this
    $('#fb_preview').html('<img src="/assets/loading.gif"/>')
    $('#fb_preview2').html('')
    $('#fb_preview3').html('')
    FB.api "/" + $('#fb_album').val() + "?fields=photos.limit(500).fields(picture,id)", (res) ->
      console.log res
      $('#fb_preview').html('')
      $('#fb_preview2').html('')
      $('#fb_preview3').html('')
      $('#fb_preview').text('no photos QAQ') unless res.photos
      res.photos["data"].forEach (photo) ->
        view = new WishPlus.Views.StoryShow.NewFBPhotoWish({model:photo, collection: self.collection})
        $('#fb_preview').append(view.render().el)


  render: ->
    $(@el).html(@template())
    FB.api "/me?fields=albums.limit(500).fields(name)", (res) ->
      res.albums["data"].forEach (album) ->
        $('#fb_album').append('<option value="'+album["id"]+'">'+album["name"]+'</option>')
      $('#fb_album').chosen()
    this

