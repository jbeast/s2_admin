define [
  "text!../../partials/loading.html",
  "text!../../partials/error.html",
  "text!../../partials/warning.html",
  ], (LoadingPartial, ErrorPartial, WarningPartial) ->

  class AppController

    constructor: (appView) ->
      _.extend this, Backbone.Events
      @_view = appView

    loadingTemplate: _.template(LoadingPartial)

    errorTemplate: _.template(ErrorPartial)

    warningTemplate: _.template(WarningPartial)

    loading: () ->
      @_clear()
      @_view.$el.html($ @loadingTemplate() )

    warn: (warningText) ->
      @_clear
      @_view.$el.html($ @warningTemplate({ warningText: warningText }) )

    error: (errorText) ->
      @_clear
      @_view.$el.html($ @errorTemplate({ errorText: errorText }) )

    show: (view) ->
      @_view.$el.html(view.render().el)
      @_currentSubView = view

    _clear: () ->
      @_currentSubView.remove() if @_currentSubView?
      @_currentSubView = null