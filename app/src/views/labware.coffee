define [
  "backbone",
  "text!../../partials/labware.html",
  "text!../../partials/labware_info_table.html"
], (Backbone, LabwarePartial, LabwareInfoTablePartial) ->

  class LabwareView extends Backbone.View

    initialize: (svgText) ->
      @_svg = @_createSVG(svgText)
      @model.on "change", @render

    className: "row"

    template: _.template LabwarePartial

    tableTemplate: _.template LabwareInfoTablePartial

    parser: new DOMParser()

    _createSVG: (xmlString) ->
      @parser.parseFromString(xmlString, "image/svg+xml").documentElement 

    render: () ->
      @$el.append @template()

      @$("#svg").append @_svg

      info =
        attributes: @model.attributes
        labels:     @model.labels.attributes

      @$("#information")
        .append(@tableTemplate info)

      this
