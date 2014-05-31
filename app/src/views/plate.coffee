define [
  "views/labware",
  "views/slot_like",
  "views/well_table",
  "text!../../images/svgs/96_plate.svg"
], (LabwareView, SlotLikeView, WellTableView, PlateSVG) ->

  class PlateView extends LabwareView
    
    initialize: () ->
      super(PlateSVG)
      @model.on "change", @render

    render: () ->

      super()

      @model.wells.each (well) =>
        slotLike = new SlotLikeView
          model: well,
          el   : @$ ".#{ well.get("slot") }"

      wellTable = new WellTableView 
        collection: @model.wells
        el: @$("#information")
      
      wellTable.render()

      this
