define [ "backbone", "models/aliquot" ], (Backbone, Aliquot) ->

  class Aliquots extends Backbone.Collection

    model: Aliquot
