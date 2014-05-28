define [
  "views/labware",
  "views/well",
  "text!../../images/svgs/96_plate.svg"
], (LabwareView, WellView, PlateSVG) ->

  class PlateView extends LabwareView
    
    initialize: () ->
      @svg =  @_createSVG(PlateSVG)
      @model.on "change", @render

    render: () ->
      @$el.append @svg

      @model.wells.each (wellModel) =>
        new WellView
          model: wellModel,
          el   : @$ ".#{ wellModel.get("location") }"

      @_renderLabel()

      this
