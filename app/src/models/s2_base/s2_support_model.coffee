define ['models/s2_base/s2_model'], (S2Model) ->

  class S2Support extends S2Model

    baseUrl: () ->
      super() + '/lims-support'