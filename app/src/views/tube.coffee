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

      aliquot = @model.aliquots.find (aliquot) ->
        aliquot.has "sample"

      oldClass = $(".aliquot", @_svg).attr "class"
      newClass = aliquot.get("type").replace(/[^\w-]+/g, '_').toLowerCase()
      $(".aliquot", @_svg).attr("class", "#{ newClass }  #{ oldClass }")

      this
