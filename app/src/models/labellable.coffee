define ["models/s2_base/s2_laboratory"], (S2Laboratory) ->

  class Labellable extends S2Laboratory

    urlRoot: () ->
      @baseUrl() + "/labellables"
