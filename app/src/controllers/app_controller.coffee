define () ->

  class AppController

    constructor: (appView) ->
      _.extend this, Backbone.Events
      @_view = appView

    show: (view) ->
      @_currentSubView.remove() if @_currentSubView?
      @_view.$el.append(view.render().el)
      @_currentSubView = view
