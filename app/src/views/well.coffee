define [ "backbone" ], (Backbone) ->

  class WellView extends Backbone.View

    events:
      mouseover: "displayWell"

    displayWell: (e) ->
      console.log @model.attributes
