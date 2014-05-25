define [
  "views/labware",
  "text!../../images/svgs/tube.svg"
], (LabwareView, tubeSVG) ->

  class TubeView extends LabwareView

    constructor: () ->
      @el = @createSVG(tubeSVG)
