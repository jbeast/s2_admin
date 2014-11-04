define [
  "text!../config/config.json"
  "text!../config/sample.json"
], (ConfigJson, SampleJson) ->

  config = JSON.parse(ConfigJson)
  config.sample = JSON.parse(SampleJson)
  config