#/*global require*/
'use strict'

window.S2 = {};

require [
  'backbone',
  'jquery',
  'lib/ajax',
  'controllers/app_controller',
  'views/app_view',
  'views/search',
  'router'
], (Backbone, $, Ajax, AppController, AppView, SearchView, Router) ->

  Backbone.ajax = Ajax;

  appView = new AppView;
  searchView = new SearchView({ el: $("#search") })

  S2.Dispatch = _.extend({}, Backbone.Events)
  S2.App      = new AppController(appView)

  $(() ->
    S2.Router = new Router();
    Backbone.history.start();
  )