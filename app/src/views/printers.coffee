define [
  "backbone",
  "text!../../partials/printing.html"
], (Backbone, PrintingPartial) ->

  class PrintersView extends Backbone.View

    initialize: (options) ->
      @validPrinters = S2.Printers.where label_type: options.labware.printerType

    template: _.template PrintingPartial

    render: () ->
      debugger
      @$el.html @template({ printers: @validPrinters })
      this
