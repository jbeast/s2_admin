define [ "backbone", "collections/aliquots" ], (Backbone, Aliquots) ->

  class Well extends Backbone.Model

    initialize: () ->
      @aliquots = new Aliquots @get("aliquots") if @get("aliquots")?

    getSample: () ->
      if @aliquots?
        @aliquots.getSample()
