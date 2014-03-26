define [
  "models/s2_base/s2_laboratory", 
  "models/labellable",
  "models/search"
  ], (S2Laboratory, Labellable, Search) ->

  class Label extends S2Laboratory

    initialize: (attributes) ->
      @set("labellable", new Labellable { uuid: attributes.uuid}) if attributes.uuid?

    searchForLabware: (labwareType, action = "first") ->
      search = new Search()
      search.labwareByLabel this, labwareType, action

    searchForLabellable: (action = "first") ->
      search = new Search()
      search.labellableByLabel this, action