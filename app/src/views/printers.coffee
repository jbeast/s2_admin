define [
  "backbone",
  "text!../../partials/printing.html"
], (Backbone, PrintingPartial) ->

  class PrintersView extends Backbone.View

    initialize: (options) ->
      @_labware = options.labware;
      @validPrinters = S2.Printers.where label_type: @_labware.printerType

    events:
      "click button": "printLabel"

    template: _.template PrintingPartial

    render: () ->
      @$el.html @template({ printers: @validPrinters })
      this

    printLabel: () ->
      printer = S2.Printers.findWhere({ name: @_selectedPrinter()})
      printer.print(@_labware)

    _selectedPrinter: () ->
      @$('select option:selected').val()
