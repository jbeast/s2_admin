# Top parent collection for all collections in S2

define [
  "backbone",
  "config"
], (Backbone, Config) ->

  class S2Collection extends Backbone.Collection

    constructor: () ->
      @config = Config
      super(arguments...)

    baseUrl: () ->
      @config.baseUrl