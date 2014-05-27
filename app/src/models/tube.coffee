define [
  "models/s2_base/s2_labware_model",
  "models/label",
  "collections/aliquots"
], (S2LabwareModel, Label, Aliquots) ->

  class Tube extends S2LabwareModel

    initialize: (attributes) ->
      @aliquots = new Aliquots @get("aliquots")
      @labels   = new Label @get("labels") 
 
    urlRoot: () ->
      @baseUrl() + "/tubes"

    parse: (response, options) ->
      attr = response.tube
