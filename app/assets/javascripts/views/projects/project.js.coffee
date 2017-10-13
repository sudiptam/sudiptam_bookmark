class Bookmark.Views.Project extends Backbone.View
  tagName: 'tr'
  template: JST['projects/entry']

  events: ->
    'click #edit'   :   'openDialog'
    'click #update' :   'updateDetails'
    'click #delete' :   'deletion'
    'click #fav'    :   'addFavorite'
    'click #archive':   'addArchive'
    'submit #submit':   'createTag'

  initialize: ->
  	@model.on('reset' ,@render ,this)
  	@model.on('change' ,@render , this)

  render: ->
    $(@el).html(@template(wats: @model))
    this

  $(document).ready ->
  $ ->
    $('#dialog').dialog autoOpen: false
    this

  openDialog: ->
    $(@el).find("#dialog").dialog('open')
    console.log($(@el).find("#dialog").val())
    this

  updateDetails: ->
    update_url = $(@el).find("#url").val()
    update_title = $(@el).find("#url").val()

    if(update_url =="" && update_title =="")
      alert("url or title cannot be null")

    else
      @model.save(url: update_url ,title: update_title)
      $('#dialog').dialog('close')

  createTag: (e) ->
    e.preventDefault()
    value = $(@el).find("#createtag").val()
    console.log(value)
    @model.save(tag_name: value)

  addFavorite: ->    
    is_favourite = @model.get('favorites')
    console.log(is_favourite)
    
    if(is_favourite == null)      
      @model.save(favorites: true)
      
    else if(is_favourite == true) 
      @model.save(favorites: false)

    else if(is_favourite == false) 
      @model.save(favorites: true)

    console.log(@model.get('favorites'))


  addArchive: ->
    value = @model.get('archive')
    console.log(value)

    if(value == null)
      @model.save(archive: true)

    else if(value == true)
      @model.save(archive: false)
      
    else if(value == false)
      @model.save(archive: true)

    console.log(@model.get('archive'))

  deletion: (e) ->
    e.preventDefault()
    @model.destroy()