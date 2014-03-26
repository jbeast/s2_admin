define ["models/s2_base/s2_laboratory", "models/search"], (S2Laboratory, Search) -> 

  class Batch extends S2Laboratory

    searchForLabware: (labwareType, action = "first") ->
      search = new Search
      search.labwareByBatch this, labwareType, action
