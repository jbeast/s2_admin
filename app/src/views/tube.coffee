define [
  "views/labware",
  "text!../../images/svgs/tube.svg"
], (LabwareView, tubeSVG) ->

  class TubeView extends LabwareView

    initialize: () ->
      @svg =  @createSVG(tubeSVG)

      this.model.on "change", @render

    render: () ->
      @$el.append @svg
      this
