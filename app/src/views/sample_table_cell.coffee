define [ "backbone" ], (Backbone) ->

  class SampleTableCellView extends Backbone.View
  
    initialize: (attributes) ->

      @model.on "change", () =>
        setTimeout () =>
          @render()
        , Math.random() * 10 * 1000 # LOLZ 

    render: () ->
      @$el.html @model.get("sanger_sample_id")
      this
