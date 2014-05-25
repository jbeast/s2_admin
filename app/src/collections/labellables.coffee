define [ "backbone", "models/labellable" ], (Backbone, Labellable) ->

  class Labellables extends Backbone.Collection

    model: Labellable 
