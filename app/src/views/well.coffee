define [ "backbone" ], (Backbone) ->

  class WellView extends Backbone.View

    initialize: () ->
      # Cause you can't use $.addClass() with svgs DAWG
      oldClass = @$el.attr "class"
      newClass = @model.get("aliquot").type.toLowerCase()
      @$el.attr("class", "#{ newClass }  #{ oldClass }")

    events:
      mouseover: "highlightWell"
      mouseout:  "normalizeWell"

    highlightWell: (e) ->
      @model.trigger "highlight"

    normalizeWell: () ->
      @model.trigger "normalize"
