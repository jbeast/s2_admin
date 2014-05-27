define [ "backbone", "views/label" ], (Backbone, LabelView) ->

  class LabwareView extends Backbone.View

    parser: new DOMParser()

    _createSVG: (xmlString) ->
      @parser.parseFromString(xmlString, "image/svg+xml").documentElement 

    _renderLabel: () ->
      if @model.labels?
        labelView = new LabelView({ model: @model.labels }).render().el 
        @$el.append labelView
