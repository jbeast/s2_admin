define [ "backbone", "models/tube" ], (Backbone, Tube) ->

  class Tubes extends Backbone.Collection

    model: Tube
