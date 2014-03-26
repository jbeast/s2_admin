#/*global require*/
'use strict'

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
  'lib/ajax',
  'models/sample'
], (Backbone, Ajax, Sample) ->
  Backbone.ajax = Ajax;

  sample = new Sample gender: "alien", sampleType: "RNA"

  sample.on("invalid", (model, error) ->
    console.log error
  )

  sample.isValid()