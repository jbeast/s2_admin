define [
  "text!../../partials/loading.html",
  "text!../../partials/error.html",
  "text!../../partials/warning.html",
  "text!../../partials/info.html",
  ], (LoadingPartial, ErrorPartial, WarningPartial, InfoPartial) ->

  class AppController

    constructor: (appView) ->
      _.extend this, Backbone.Events
      @_view = appView

    loadingTemplate: _.template(LoadingPartial)

    errorTemplate: _.template(ErrorPartial)

    warningTemplate: _.template(WarningPartial)

    infoTemplate: _.template(InfoPartial)

    loading: () ->
      @_clear()
      @_view.$el.html($ @loadingTemplate() )

    error: (errorText) ->
      @_clear
      @_view.$el.html($ @errorTemplate({ errorText: errorText }) )

    warn: (warningText) ->
      @_clear
      @_view.$el.html($ @warningTemplate({ warningText: warningText }) )

    info: (infoText) ->
      @_clear
      @_view.$el.html($ @infoTemplate({ infoText: infoText }) )

    show: (view) ->
      @_view.$el.html(view.render().el)
      @_currentSubView = view

    _clear: () ->
      @_currentSubView.remove() if @_currentSubView?
      @_currentSubView = null