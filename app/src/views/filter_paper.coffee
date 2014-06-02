define [
  "views/labware",
  "text!../../images/svgs/filter_paper.svg"
], (LabwareView, FilterPaperSVG) ->

  class FilterPaperView extends LabwareView

    initialize: () ->
      super(FilterPaperSVG)

    render: () ->

      super()

      this
