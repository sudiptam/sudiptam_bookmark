class Bookmark.Routers.Projects extends Backbone.Router
  routes:
    '':'index'
    'favorites'  : 'showFavorite'
    'archive'    : 'showArchive'
    'folder/:id' : 'showContents'

  initialize: ->
    @collection = new Bookmark.Collections.Projects()
    @collection = new Bookmark.Collections.Tags()

  index: ->
    @collection.fetch
      wait:true
      reset:true
    view = new Bookmark.Views.ProjectsIndex(collection: @collection)
    $("#con").html(view.render().el)

  showFavorite: ->
    @collection.fetch
      wait:true
      reset:true
      url:"api/favorites"
    view = new Bookmark.Views.Favoritelist(collection: @collection)
    $("#con").html(view.render().el)

  showArchive: ->
    @collection.fetch
      wait:true
      reset:true
      url:"api/archive"
    view = new Bookmark.Views.Archivelist(collection: @collection)
    $("#con").html(view.render().el)

  showContents: (id) ->
    console.log(id)
    @collection.fetch
      url: "api/folder/#{id}"
      data: { tag_id: id }
      wait:true
      reset:true
    view = new Bookmark.Views.Content(collection: @collection)
    $("#con").html(view.render().el)

