define [
  "models/s2_base/s2_laboratory", 
  "models/labellable",
  "models/search",
  "collections/labellables"
  ], (S2Laboratory, Labellable, Search, Labellables) ->

  class Label extends S2Laboratory

    initialize: (attributes) ->
      @set("labellable", new Labellable { uuid: attributes.uuid}) if attributes.uuid?

    searchForLabware: (labwareType, action = "first") ->
      search = new Search()
      search.labwareByLabel this, labwareType, action

    searchForLabellable: (action = "first") ->
      search = new Search()
      search.labellableByLabel(this, action)
        .then((result) ->
          new Labellables result.labellables
        )
