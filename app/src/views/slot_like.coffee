define [ "backbone" ], (Backbone) ->

  class SlotLikeView extends Backbone.View

    initialize: () ->
      aliquot = @model.aliquots.find (aliquot) ->
        aliquot.has "sample"

      # Cause you can't use $.addClass() with svgs DAWG
      oldClass = @$el.attr "class"
      newClass = aliquot.get("type").replace(/[^\w-]+/g, '_').toLowerCase()
      @$el.attr("class", "#{ newClass }  #{ oldClass }")

    events:
      mouseover: "highlightSlot"
      mouseout:  "normalizeSlot"
      click:     "goToSample"

    highlightSlot: (e) ->
      @model.trigger "highlight"

    normalizeSlot: () ->
      @model.trigger "normalize"

    goToSample: () ->
      uuid = @model.get("uuid")
      if (uuid?)
        S2.Router.navigate "labware/" + uuid, { trigger: true } 
