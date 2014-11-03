define ["config"], (Config) ->

  errors =
    sample:
      mandatoryFieldsError: "Sample must contain the fields: #{Config.sample.mandatoryFields.join(", ")}"
      validStatesError: "STATE is not valid. STATE must be one of the following: #{Config.sample.validStates.join(", ")}"
      mandatoryIfStateIsPublishedError: "If STATE is PUBLISHED, sample must be one of the following: #{Config.sample.mandatoryIfStateIsPublished.join(", ")}"
      validSampleTypesError: "SAMPLE_TYPE must be one of #{Config.sample.validSampleTypes.join(", ")}"
      validGendersError: "GENDER must be one of the following: #{Config.sample.validGenders.join(", ")}"