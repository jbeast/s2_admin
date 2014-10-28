define [
  "models/s2_base/s2_labware_model",
  "collections/wells"
], (S2LabwareModel, Wells) ->

  class Plate extends S2LabwareModel

    initialize: (attributes) ->
      super arguments...

      wells = _.reduce @get("wells"), (memo, aliquots, slot) ->

        if aliquots.length is 0
          return memo

        well =
          slot: slot
          aliquots: aliquots

        memo.push well
        memo
      , []

      this.wells = new Wells wells

    urlRoot: () ->
      @baseUrl() + "/plates"

    printerType: 'tube_rack'
