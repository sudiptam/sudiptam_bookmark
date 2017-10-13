class Bookmark.Views.Content extends Backbone.View
  template: JST['projects/content']

  initialize: ->
    @collection.on('reset' ,@render ,this)

  render: ->
    $(@el).html(@template(content: @collection))
    this