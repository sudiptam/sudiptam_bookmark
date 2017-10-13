window.Bookmark =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    d=new Bookmark.Routers.Projects()
    Backbone.history.start()

$(document).ready ->
  Bookmark.init()
