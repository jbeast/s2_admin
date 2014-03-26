define [
  "backbone", 
  "models/s2_base/s2_laboratory"
  ], (Backbone, S2Laboratory) ->

  class SearchModel extends S2Laboratory

    urlRoot: () ->
      @baseUrl() + "/searches"

    orderByUUID: (labware, action = "first") ->
      @set search:
        criteria: 
          item:
            uuid: labware.get("uuid")
        description: "Search for an order by labware"
        model: "order"

      @_saveThenAction action

    labwareByLabel: (label, labwareType, action) ->
      @set search:
        criteria:
          label:
            position: label.get("position")
            type:     label.get("type")
            value:    label.get("value")
        description: "Search for labware by label"
        model: labwareType

      @_saveThenAction action

    labwareByBatch: (batch, labwareType, action) ->
      @set search:
        criteria:
          batch:
            uuid: batch.get("uuid")
        description: "Search for labware by batch"
        model: labwareType

      @_saveThenAction action

    labellableByLabel: (label, action) ->
      @set search:
        criteria:
          label:
            value: label.get("value")
        description: "Search for labellable by label"
        model: "labellable"

      @_saveThenAction action

    locationByName: (name, action = "first") ->
      @set search:
        criteria:
          comparison:
            name:
              like: name
        description: "Search for a location by location name"
        model: "location"

      @_saveThenAction action

    parse: (result) ->
      result.search

    _saveThenAction: (action) ->
      @save().then(() => @_action action)

    _action: (action) ->
      Backbone.ajax 
        url: @get("actions")[action]
