define [
  "views/labware",
  "text!../../images/svgs/96_plate.svg"
], (LabwareView, PlateSVG) ->

  class PlateView extends LabwareView
    
    initialize: () ->
      @svg =  @createSVG(PlateSVG)

      this.model.on "change", @render

    render: () ->
      @$el.append @svg
      this
