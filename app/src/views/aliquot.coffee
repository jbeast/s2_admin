define [ "backbone" ], (Backbone) ->

  class AliquotView extends Backbone.View

    tagName: 'ul'

    template: _.template "<li><b>Sample Type: </b><%= type %></li>"

    render: () ->
      console.log @template(@model.attributes)
      @$el.html(@template @model.attributes) 
      this
