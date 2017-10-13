class Bookmark.Views.ProjectsIndex extends Backbone.View

  template: JST['projects/index']

  events: ->
    "submit #entry" :"createEntry"
    "change #folder": "folderSelected"
    
  initialize: ->
    @tag_collection = new Bookmark.Collections.Tags()
    @collection.on('reset' ,@render ,this)
    @collection.on('add' ,@render, this)
    @collection.on('remove' ,@render , this)
    @tag_collection.on('reset' ,@render ,this)
    @tag_collection.fetch({reset: true ,wait: true})

  render: ->
    $(@el).html(@template(tags: @tag_collection))
    @collection.each(@appendEntry)
    this

  appendEntry: (en) ->
    view = new Bookmark.Views.Project(model: en)
    $('#entries').prepend(view.render().el)

  createEntry: (event) ->
    event.preventDefault()
    if($('#url').val() == "" && $('#title').val() == "")
      alert("Url or title cannot be null")
      return
    else
    @collection.create url: $('#url').val() ,title: $('#title').val() ,favorites:$("#favt").val() ,
    archive:$("#arch").val() ,tag_id: $('#tag_id').val()

  folderSelected: (e)->
    id =  $(e.currentTarget).val()
    console.log(id)
    window.location.href = "#folder/#{id}"
