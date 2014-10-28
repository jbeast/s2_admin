define ['models/s2_base/s2_support_model'], (S2Support) ->

  class Printer extends S2Support

    print: (labware) ->
      template = labware.labelTemplate()
      # S2.App.info("Printing to #{ @get('name') }")
