#/*global require*/
'use strict'

window.S2 = {}

require.config
  baseUrl: "../scripts"
  shim:
    underscore:
      exports: '_'
    backbone:
      deps: [
        'underscore'
        'jquery'
      ]
      exports: 'Backbone'
    bootstrap:
      deps: ['jquery'],
      exports: 'jquery'
  paths:
    jquery: '../bower_components/jquery/jquery'
    backbone: '../bower_components/backbone/backbone'
    underscore: '../bower_components/underscore/underscore'
    bootstrap: '../bower_components/sass-bootstrap/dist/js/bootstrap'
    text: '../bower_components/requirejs-text/text'
    config: 'config/config',
    spec: '../spec'

require [
  'backbone',
  'jquery',
  'lib/ajax',
  'controllers/app_controller',
  'views/app_view',
  'router'
], (Backbone, $, Ajax, AppController, AppView, Router) ->
  Backbone.ajax = Ajax;

  appView = new AppView;

  S2.App = new AppController appView

  $( () -> 
    S2.Router = new Router
    Backbone.history.start()
  )
