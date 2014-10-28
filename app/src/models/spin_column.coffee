define ["models/s2_base/s2_labware_model"], (S2Labware) ->

  class SpinColumn extends S2Labware

    urlRoot: () ->
      @baseUrl() + "/spin_columns"

    printerType: "tube"