define [], () ->

  (request) ->
    request.headers = {
      "user-email": "user@sanger.ac.uk",
      "Content-Type": "application/json"
    }
    request.dataType ?= "json"
    $.ajax(request)