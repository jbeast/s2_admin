define [
  "models/tube",

  "views/tube"
], (TubeModel, TubeView) ->

  labware =
    tube: 
      model: TubeModel
      view: TubeView

  (name) ->

    if not labware[name]?
      throw new Error "Labware #{name} does not exist"

    labware[name]
