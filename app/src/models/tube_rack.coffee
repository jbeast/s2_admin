define ["models/s2_base/s2_labware_model"], (S2LabwareModel) ->

  class TubeRack extends S2LabwareModel

    urlRoot: () ->
      @baseUrl() + "/tube_racks"