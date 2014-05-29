define [ "backbone", "text!../../partials/search.html" ], (Backbone, SearchPartial) ->

  class SearchView extends Backbone.View

    initialize: () ->
      @render()

    events:
      "submit form": "navigateToLabware"

    template: _.template SearchPartial

    render: () ->
      @$el.append @template()
      this

    inputValue: () ->
      @$('input').val()

    searchType: () ->
      @$('select option:selected').val()

    navigateToLabware: (e) ->
      e.preventDefault()

      S2.Router.navigate "labware/#{ @searchType() }/#{ @inputValue() }", { trigger: true }

