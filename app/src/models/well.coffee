define [ "backbone", "models/aliquot" ], (Backbone, Aliquot) ->

  class Well extends Backbone.Model

    initialize: () ->
      @aliquot = new Aliquot @get("aliquot") if @get("aliquot")?

    getSample: () ->
      if @aliquot?
        @aliquot.getSample()
      else
        $.Deferred.reject("No sample information available for this well")
