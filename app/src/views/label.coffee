define [
  "backbone"  
], (Backbone) ->

  class LabelView extends Backbone.View

    tagName: 'ul'

    template: _.template "<li><b>EAN13 Barcode: </b><%= label.barcode.value %></li>
      <li><b>Sanger Barcode: </b><%= label['sanger label'].value %></li>"

    render: () ->
      @$el.html @template({ label: @model.attributes })
      this
