define [
  "models/s2_base/s2_labware_model",
  "collections/wells"
], (S2LabwareModel, Wells) ->

  class Plate extends S2LabwareModel
    
    initialize: (attributes) ->
      super arguments...

      wells = _.reduce @get("wells"), (memo, value, location) ->
        [aliquot, details] = value

        well =
          location: location
          aliquot : aliquot
          details : details

        memo.push well
        memo
      , []

      this.wells = new Wells wells

    urlRoot: () ->
      @baseUrl() + "/plates"

    nonEmptyWells: () ->
      _.reduce(@get("wells"), (memo, value, wellName) ->
        if value.length isnt 0
          memo[wellName] = value
        memo
      , {})

