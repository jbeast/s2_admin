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

      if @model.aliquots?
        @model.aliquots.each (aliquot) =>
          aliquotView = new AliquotView({ model: aliquot }).render().el
          @$el.append aliquotView

      this
