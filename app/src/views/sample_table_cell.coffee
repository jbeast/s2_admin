define [ "backbone" ], (Backbone) ->

  class SampleTableCellView extends Backbone.View
  
    initialize: (attributes) ->
      @model.on "change", () =>
        @render()

    render: () ->
      @$el.html @model.get("sanger_sample_id")
      this
