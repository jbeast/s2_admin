define [
  "models/tube",
  "models/plate",
  "models/tube_rack",
  "models/filter_paper",

  "views/tube",
  "views/plate",
  "views/tube_rack",
  "views/filter_paper"
], (
  TubeModel,
  PlateModel,
  TubeRackModel,
  FilterPaperModel,
  
  TubeView,
  PlateView,
  TubeRackView,
  FilterPaperView
) ->

  labware =
    tube: 
      model: TubeModel
      view: TubeView
    plate:
      model: PlateModel
      view: PlateView
    tube_rack:
      model: TubeRackModel
      view: TubeRackView
    filter_paper:
      model: FilterPaperModel
      view: FilterPaperView

  (name) ->

    if not labware[name]?
      throw new Error "Labware #{name} does not exist"

    labware[name]
