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

      table = $(@tableTemplate())

      @collection.each (well) =>
        tableRow = $(@tableRowTemplate well.toJSON())

        sample = well.getSample()

        tableCellView = new SampleTableCellView model: sample, el: $("td.sample", tableRow).get(0)
        
        table.append tableRow

        sample.fetch()

      @$el.append(table)
