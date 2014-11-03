#/*global require*/
'use strict'

window.S2 = {};

require [
  'backbone',
  'jquery',
  'lib/ajax',
  'controllers/app_controller',
  'collections/printers'
  'views/app_view',
  'views/search',
  'router'
], (Backbone, $, Ajax, AppController, Printers, AppView, SearchView, Router) ->

  Backbone.ajax = Ajax

  appView = new AppView;
  searchView = new SearchView({ el: $("#search") })

  S2.Dispatch = _.extend({}, Backbone.Events)
  S2.App      = new AppController(appView)
  S2.Printers = new Printers()

  S2.Printers.fetch()

  $(() ->
    S2.Router = new Router()
    Backbone.history.start()
  )