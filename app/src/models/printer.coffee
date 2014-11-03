define [
  'backbone',
  'models/s2_base/s2_support_model'
], (Backbone, S2Support) ->

  class Printer extends S2Support

    print: (labware) ->