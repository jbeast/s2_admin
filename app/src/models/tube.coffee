define [
  "models/s2_base/s2_labware_model",
  "models/label"
], (S2LabwareModel, Label) ->

  class Tube extends S2LabwareModel

    urlRoot: () ->
      @baseUrl() + "/tubes"

    parse: (response, options) ->
      attrs        = response.tube
