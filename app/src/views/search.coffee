define [ "backbone" ], (Backbone) ->

  class SearchView extends Backbone.View

    events:
      "keyup input": "searchIfEnter"

    template: _.template "<input type=\"search\" /><select>
      <option value=\"ean13\" selected>EAN13</option>
      <option value=\"sanger-barcode\">Sanger Barcode</option></select>"

    render: () ->
      @$el.append @template
      this

    inputValue: () ->
      @$('input').val()

    searchType: () ->
      @$('select option:selected').val()

    searchIfEnter: (e) ->
      if e.keyCode isnt 13
        return

      S2.Router.navigate "labware/#{ @searchType() }/#{ @inputValue() }", { trigger: true }

