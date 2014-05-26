define [
  "models/tube",
  "models/plate",

  "views/tube",
  "views/plate"
], (
  TubeModel,
  PlateModel,
  
  TubeView,
  PlateView
) ->

  labware =
    tube: 
      model: TubeModel
      view: TubeView
    plate:
      model: PlateModel
      view: PlateView

  (name) ->

    if not labware[name]?
      throw new Error "Labware #{name} does not exist"

    labware[name]
