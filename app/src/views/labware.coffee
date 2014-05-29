define [
  "backbone",
  "text!../../partials/labware.html",
  "text!../../partials/labware_info_table.html"
], (Backbone, LabwarePartial, LabwareInfoTablePartial) ->

  class LabwareView extends Backbone.View

    className: "row"

    template: _.template LabwarePartial

    tableTemplate: _.template LabwareInfoTablePartial

    parser: new DOMParser()

    _createSVG: (xmlString) ->
      @parser.parseFromString(xmlString, "image/svg+xml").documentElement 

    render: (info) ->
      @$el.append @template()

      @$("#svg").append @_svg

      @$("#information")
        .append(@tableTemplate info)

      this
