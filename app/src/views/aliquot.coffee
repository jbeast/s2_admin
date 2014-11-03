define [ "backbone" ], (Backbone) ->

  class AliquotView extends Backbone.View

    tagName: 'ul'

    template: _.template "<li><b>Sample Type: </b><%= type %></li>"

    render: () ->
      @$el.html(@template @model.attributes)
      this
