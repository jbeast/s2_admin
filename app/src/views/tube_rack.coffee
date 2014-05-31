define [
  "views/labware",
  "views/slot_like",
  "text!../../images/svgs/rack.svg"
], (LabwareView, SlotLikeView, TubeRackSVG) ->

  class TubeRackView extends LabwareView

    initialize: () ->
      super(TubeRackSVG)

    render: () ->
      super()

      @model.tubes.each (tube) =>
        slotLike = new SlotLikeView
          model: tube
          el   : @$ ".#{ tube.get("slot") }"

      this
