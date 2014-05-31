define [ "backbone" ], (Backbone) ->

  class SlotLikeView extends Backbone.View

    initialize: () ->
      aliquot = @model.aliquots.find (aliquot) ->
        aliquot.has "sample"

      # Cause you can't use $.addClass() with svgs DAWG
      oldClass = @$el.attr "class"
      newClass = aliquot.get("type").toLowerCase()
      @$el.attr("class", "#{ newClass }  #{ oldClass }")

    events:
      mouseover: "highlightSlot"
      mouseout:  "normalizeSlot"

    highlightSlot: (e) ->
      @model.trigger "highlight"

    normalizeSlot: () ->
      @model.trigger "normalize"
