define [
  'backbone',
  'collections/s2_collection',
  'models/printer'
], (Backbone, S2Collection, Printer) ->

  class Printers extends S2Collection

    model: Printer

    baseUrl: () ->
      super() + '/lims-support/label_printers'

    fetch: (action = 'first') ->
      Backbone.ajax({ url: @baseUrl() })
        .then((res) =>
          @url = res['label_printers']['actions'][action]
          super()
        )

    parse: (res) =>
      res.label_printers
