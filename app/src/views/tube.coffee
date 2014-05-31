define [
  "views/labware",
  "views/aliquot",
  "text!../../images/svgs/tube.svg"
], (LabwareView, AliquotView, tubeSVG) ->

  class TubeView extends LabwareView

    initialize: () ->
      super(tubeSVG)

    render: () ->

      super()

      this
