define [
  "models/s2_base/s2_labware_model",
  "collections/aliquots"
], (S2LabwareModel, Aliquots) ->

  class FilterPaperModel extends S2LabwareModel

    initialize: (attributes) ->
      super arguments...
      @aliquots = new Aliquots @get("aliquots")

    urlRoot: () ->
      @baseUrl() + "/filter_papers"
