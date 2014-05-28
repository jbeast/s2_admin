define [ "backbone", "models/well" ], (Backbone, Well) ->

  class Wells extends Backbone.Collection

    model: Well
