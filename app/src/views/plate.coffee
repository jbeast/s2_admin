define [
  "views/labware",
  "views/well",
  "views/well_table",
  "text!../../images/svgs/96_plate.svg"
], (LabwareView, WellView, WellTableView, PlateSVG) ->

  class PlateView extends LabwareView
    
    initialize: () ->
      @_svg =  @_createSVG(PlateSVG)
      @model.on "change", @render

    render: () ->
      super
        attributes: @model.attributes
        labels:     @model.labels.attributes

      @model.wells.each (wellModel) =>
        wellView = new WellView
          model: wellModel,
          el   : @$ ".#{ wellModel.get("location") }"

        @listenTo wellView, "hoverOn", @displayWellInfo

      wellTable = new WellTableView { collection: @model.wells, el: @$("#information") }
      wellTable.render()

      this

    displayWellInfo: (wellInfo) ->
      console.log "Display that info"
      console.log wellInfo
