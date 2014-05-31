define [ "text!../../partials/loading.html" ], (LoadingPartial) ->

  class AppController

    constructor: (appView) ->
      _.extend this, Backbone.Events
      @_view = appView

    template: _.template(LoadingPartial)

    loading: () ->
      @_currentSubView.remove() if @_currentSubView?
      @_currentSubView = null
      @_view.$el.html($ @template() )

    show: (view) ->
      @_view.$el.html(view.render().el)
      @_currentSubView = view
