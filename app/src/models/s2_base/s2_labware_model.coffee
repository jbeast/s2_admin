# Base model for all labware

define ["models/s2_base/s2_laboratory", "models/label", "models/search"], (S2Laboratory, Label, Search) ->

  class S2LabwareModel extends S2Laboratory

    initialize: (attributes) ->
      @labels   = new Label @get("labels")

    order: () ->
      search = new Search
      search.orderByUUID(this)
