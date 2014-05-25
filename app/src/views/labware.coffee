define ["backbone"], (Backbone) ->

  class LabwareView extends Backbone.View

    parser: new DOMParser()

    createSVG: (xmlString) ->
      @parser.parseFromString(xmlString, "image/svg+xml").documentElement 
