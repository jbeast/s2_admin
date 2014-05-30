define [
  "models/s2_base/s2_management", 
  "underscore"
], (S2Management, _) ->

  class Sample extends S2Management

    urlRoot: () ->
      @baseUrl() + "/samples"

    parse: (response) ->
      response.sample

    validate: (attributes, options) ->
      super()
      errors = @errors.sample
      
      unless _.contains @config.mandatoryFields, ((property) -> property in attributes)
        @_errorList.add errors.mandatoryFieldsError

      # Validate state
      if attributes.state?

        unless _.contains @config.validStates, attributes.state
          @_errorList.add errors.validStatesError
        
        if attributes.state is "published"
          unless _.every @config.mandatoryIfStateIsPublished, ((property) -> property in attributes)
            @_errorList.add errors.mandatoryIfStateIsPublishedError
            

      # Validate sample_type
      if "sample_type" of attributes
        unless _.contains @config.validSampleTypes, attributes.sample_type
          @_errorList.add errors.validSampleTypesError

      # Validate gender
      if "gender" of attributes
        unless _.contains @config.validGenders, attributes.gender
          @_errorList.add errors.validGendersError

      @_errorList.format() unless @_errorList.isEmpty()
