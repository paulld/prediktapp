predikt.factory 'Message', () ->
  Message = 

    noty: (message, type, timeout) ->
      noty {
        layout: 'topCenter'
        text: message
        type: type
        timeout: timeout
      }

