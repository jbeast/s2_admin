define [
  "backbone",
  "jquery",
  "models/label",
  "models/s2_base/s2_laboratory",
  "lib/labware_mapper"
], (Backbone, $, LabelModel, S2Laboratory, LabwareMapper) ->

  class Router extends Backbone.Router

    routes:                                    
      "search"       : "search"              
      "labware/:uuid": "labware",
      "labware/:barcodeType/:barcode": "labelSearch"
                                                
    search: () ->                              
      console.log "I am at the search page"  
                                                
    labelSearch: (barcodeType, barcode) ->                  
      label = new LabelModel { type: barcodeType, value: barcode }
      navigate = @navigate

      label.searchForLabellable()
        .then((labellables) ->
          if labellables.length is 0
            console.log "No items found"
          else if labellables.length is 1
            labellable = labellables.shift()
            navigate "labware/#{ labellable.get("name") }", { trigger: true }
        )

    labware: (uuid) ->                         
      lab = new S2Laboratory { uuid: uuid }

      lab.fetch().then( (result) ->
        name = _.first(_.keys(result))
        labware = LabwareMapper name
        model = new labware.model(result.name)
        view = new labware.view( model: model)
        S2.App.show view
      )
