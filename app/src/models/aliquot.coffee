define [ "backbone", "models/sample" ], (Backbone, Sample) ->
  
  class Aliquot extends Backbone.Model

    initialize: () ->
      if @get("sample")?
        @sample = new Sample @get("sample")

    getSample: () ->
      if @sample?
        @sample
