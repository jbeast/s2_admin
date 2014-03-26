# Base model for everything that uses lims-laboratory API

define ["models/s2_base/s2_model"], (S2Model) ->

  class S2Laboratory extends S2Model

    baseUrl: () ->
      super() + "/lims-laboratory"