# Base model for all labware

define ["models/s2_base/s2_laboratory", "models/search"], (S2Laboratory, Search) ->

  class S2LabwareModel extends S2Laboratory

    order: () ->
      search = new Search
      search.orderByUUID(this)