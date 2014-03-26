define ["models/s2_base/s2_laboratory"], (S2Laboratory) ->

  class Location extends S2Laboratory

    urlRoot: () ->
      @baseUrl() + "/locations"