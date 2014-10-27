define [
  "backbone",
  "models/label",
  "models/s2_base/s2_laboratory",
  "views/search",
  "lib/labware_mapper"
], (Backbone, LabelModel, S2Laboratory, SearchView, LabwareMapper) ->

  class Router extends Backbone.Router

    routes:
      "labware/:uuid"                 : "labware"
      "labware/:barcodeType/:barcode" : "labelSearch"

    labelSearch: (barcodeType, barcode) ->
      S2.App.loading()

      label = new LabelModel { type: barcodeType, value: barcode }

      if not label.isValid()
        S2.App.error label.validationError
        return undefined

      label.searchForLabellable()
        .then((labellables) =>

          if labellables.length is 0
            S2.App.warn "No items found for #{barcodeType} <strong>#{barcode}</strong>"

          else if labellables.length is 1
            labellable = labellables.shift()
            @_showLabware labellable.get("name")
        )

    labware: (uuid) ->
      S2.App.loading()
      @_showLabware uuid

    _showLabware: (uuid) ->
      lab = new S2Laboratory { uuid: uuid }

      lab.fetch()
        .then( (result) ->
          name = _.first(_.keys(result))
          labware = LabwareMapper name
          model = new labware.model( result[name] )
          view = new labware.view( model: model)
          S2.App.show view
        )