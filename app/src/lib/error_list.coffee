define [], () ->

  class ErrorList

    _errors: [],

    add: (message) ->
      @_errors.push message

    empty: () ->
      @_errors = []

    format: () ->
      @_errors.join("\n")

    isEmpty: () ->
      @_errors.length is 0