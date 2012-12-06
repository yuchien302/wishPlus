class WishPlus.Views.StoryShow.NewPhotoWish extends Backbone.View

  template: JST['stories/show/wishes/newphotowish']
  # tagName: 'li'
  # id: 'new_wish'

  events:
    'click #submit_new_photowish': 'newPhotoWish'

  initialize: ->

  #   @model.on('change', @render, this)
  #   @model.on('destroy', @close, this)



  newPhotoWish: (e) ->
    e.preventDefault()
    formData = new FormData($('#add_photowish_form')[0])
    console.log formData
    formData.append('wish[description]', 'lalala')
    formData.append('wish[type]', 'Photowish')



    $.ajax
      url: '/api/stories/' + @collection.story_id + '/wishes',
      type: 'POST',
      data: formData,
      processData: false,
      contentType: false,
      type: 'POST',
      success: (data) ->
        alert(data)
        


    # attributes = 
    #   name: @$('#new_photowish_name').val()
    #   type: "Photowish"
    #   story_id: @collection.story_id


    # console.log attributes
    # @collection.create attributes,
    #   wait:true
    #   success: (story) ->
    #     # window.location.assign('/stories/' + story.id )
    #     console.log "success"
    #   error: (story, msg) ->
    #     alert "error: " + msg


  render: ->
    $(@el).html(@template())
    this

  # removeWish: (e) ->
  #   e.preventDefault()
  #   @model.destroy()
  
  # close: ->
  #   this.remove()
  #   this.unbind()
  #   this.model.unbind("change", this.modelChanged)
