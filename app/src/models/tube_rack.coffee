define [
  "models/s2_base/s2_labware_model",
  "collections/tubes"
], (S2LabwareModel, Tubes) ->

  class TubeRack extends S2LabwareModel

    urlRoot: () ->
      @baseUrl() + "/tube_racks"

    initialize: (attributes) ->
      super arguments...

      tubes = _.reduce @get("tubes"), (memo, tube, slot) ->
        if not tube.aliquots?
          return memo

        tube.slot = slot

        memo.push tube
        memo
      , []
  
      this.tubes = new Tubes tubes
