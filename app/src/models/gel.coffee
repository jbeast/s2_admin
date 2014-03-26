define ["models/s2_base/s2_labware_model"], (S2Labware) ->

  class Gel extends S2Labware
    
    urlRoot: () ->
      @baseUrl() + "/gels"