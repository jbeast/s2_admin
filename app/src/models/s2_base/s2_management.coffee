# Base model for everything that uses the lims-manangement API

define ["models/s2_base/s2_model"], (S2Model) ->

  class S2Management extends S2Model

    baseUrl: () ->
      super() + "/lims-management"
