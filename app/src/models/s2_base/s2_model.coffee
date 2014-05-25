# Top parent model for all models in S2

define [
  "backbone", 
  "config", 
  "lib/errors", 
  "lib/error_list"
], (Backbone, Config, Errors, ErrorList) ->

  class S2Model extends Backbone.Model

    constructor: () ->
      @config = Config
      @errors = Errors
      super(arguments...)

    idAttribute: "uuid"
    
    baseUrl: () -> 
      "http://psd2g.internal.sanger.ac.uk:8000"

    sync: (method, model, options) ->
      options["url"] = model.baseUrl() + "/" + model.id if method is "read"
      Backbone.sync method, model, options

    validate: (attributes, options) ->
      @_errorList = new ErrorList
      undefined 
