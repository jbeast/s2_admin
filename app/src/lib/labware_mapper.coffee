define [
  "models/tube",
  "models/plate",
  "models/tube_rack",

  "views/tube",
  "views/plate",
  "views/tube_rack"
], (
  TubeModel,
  PlateModel,
  TubeRackModel,
  
  TubeView,
  PlateView,
  TubeRackView
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

  (name) ->

    if not labware[name]?
      throw new Error "Labware #{name} does not exist"

    labware[name]
