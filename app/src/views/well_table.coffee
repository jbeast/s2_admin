define [
  "backbone",
  "views/sample_table_cell",
  "text!../../partials/well_table_row.html",
  "text!../../partials/well_table.html"
], (Backbone, SampleTableCellView, WellTableRowPartial, WellTablePartial) ->

  class WellTableView extends Backbone.View

    tableTemplate: _.template WellTablePartial

    tableRowTemplate: _.template WellTableRowPartial

    render: () ->

      table = $(@tableTemplate( showLocation: true))

      @collection.each (well) =>
        tableRow = $(@tableRowTemplate well.toJSON())

        well.on "highlight", () ->
          tableRow.addClass("alert-info")

        well.on "normalize", () ->
          tableRow.removeClass("alert-info")

        sample = well.getSample()

        if sample?
          tableCellView = new SampleTableCellView
            model: sample,
            el: $("td.sample", tableRow).get(0)

          sample.fetch()

        table.append tableRow

      @$el.append(table)
