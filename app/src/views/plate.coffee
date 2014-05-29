define [
  "views/labware",
  "views/well",
  "text!../../partials/well_table.html",
  "text!../../images/svgs/96_plate.svg"
], (LabwareView, WellView, WellTablePartial, PlateSVG) ->

  class PlateView extends LabwareView
    
    initialize: () ->
      @_svg =  @_createSVG(PlateSVG)
      @model.on "change", @render

    wellTableTemplate: _.template WellTablePartial

    render: () ->

      super
        attributes: @model.attributes
        labels:     @model.labels.attributes

      @$("#information")
        .append @wellTableTemplate({ wells: @model.wells.toJSON() })

      @model.wells.each (wellModel) =>
        wellView = new WellView
          model: wellModel,
          el   : @$ ".#{ wellModel.get("location") }"

        @listenTo wellView, "hoverOn", @displayWellInfo

      this

    displayWellInfo: (wellInfo) ->
      console.log "Display that info"
      console.log wellInfo
