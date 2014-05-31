define [ "backbone", "models/aliquot" ], (Backbone, Aliquot) ->

  class Aliquots extends Backbone.Collection

    model: Aliquot

    getSample: () ->
      aliquot = @find (aliquot) ->
        _.has aliquot, "sample"
      aliquot.getSample()
