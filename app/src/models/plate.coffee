define ["models/s2_base/s2_labware_model"], (S2LabwareModel) ->

  class Plate extends S2LabwareModel
    
    urlRoot: () ->
      @baseUrl() + "/plates"
