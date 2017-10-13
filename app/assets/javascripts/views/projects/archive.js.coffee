class Bookmark.Views.Archivelist extends Backbone.View
  
  template: JST['projects/archive_entry']

  initialize: ->
  	@collection.on('reset' ,@render ,this)

  render: ->
  	$(@el).html(@template(collect: @collection))
  	this