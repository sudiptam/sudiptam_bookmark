class Bookmark.Views.Favoritelist extends Backbone.View

  template: JST['projects/index1']

  initialize: ->
  	@collection.on('reset' ,@render ,this)

  render: ->
  	$(@el).html(@template(collect: @collection))
  	this

  
    