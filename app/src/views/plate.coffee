define [
  "views/labware",
  "text!../../images/svgs/96_plate.svg"
], (LabwareView, PlateSVG) ->

  class PlateView extends LabwareView
    
    initialize: () ->
      @svg =  @_createSVG(PlateSVG)

      @model.on "change", @render

    render: () ->
      @$el.append @svg

      @_renderLabel()

      this
