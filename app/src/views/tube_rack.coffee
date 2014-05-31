define [
  "views/labware",
  "views/slot_like",
  "views/well_table",
  "text!../../images/svgs/rack.svg"
], (LabwareView, SlotLikeView, WellTableView, TubeRackSVG) ->

  class TubeRackView extends LabwareView

    initialize: () ->
      super(TubeRackSVG)

    render: () ->
      super()

      @model.tubes.each (tube) =>
        slotLike = new SlotLikeView
          model: tube
          el   : @$ ".#{ tube.get("slot") }"

      wellTable = new WellTableView
        collection: @model.tubes
        el: @$ "#information"

      wellTable.render()

      this
