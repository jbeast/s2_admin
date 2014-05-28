define [
  "views/labware",
  "views/aliquot",
  "text!../../images/svgs/tube.svg"
], (LabwareView, AliquotView, tubeSVG) ->

  class TubeView extends LabwareView

    initialize: () ->
      @_svg =  @_createSVG(tubeSVG)
      @model.on "change", @render

    render: () ->
      @$el.append @_svg

      @_renderLabel() 

      if @model.aliquots?
        @model.aliquots.each (aliquot) =>
          aliquotView = new AliquotView({ model: aliquot }).render().el
          @$el.append aliquotView

      this
