$ ->

  MINIMUM_SCORE = 2

  iconOk = (type) ->
    $('#' + type).removeClass('fa-times password-match-no')
    $('#' + type).addClass('fa-check password-match-ok')
    $('#' + type + '-text').removeClass('hide')
  iconNo = (type) ->
    $('#' + type).addClass('fa-times password-match-no')
    $('#' + type).removeClass('fa-check password-match-ok')
    $('#' + type + '-text').removeClass('hide')
  iconRemove = (type) ->
    $('#' + type).removeClass('fa-check password-match-ok fa-times password-match-no')
    $('#' + type + '-text').addClass('hide')
  
  setProgressBar = (idx, result) ->
    idx.removeClass('progress-bar-success')
    idx.removeClass('progress-bar-warning')
    idx.removeClass('progress-bar-info')
    idx.removeClass('progress-bar-danger')
    idx.addClass('progress-bar-' + result)
    
  checkPasswordStrength = ->
    if zxcvbn?
      pass = $('#password').val()
      
      timeToCrack = zxcvbn(pass).crack_time_display
      score = zxcvbn(pass).score
      strength = score * 25
      progressBar = $('#password-strengh-bar')
      
      $('#password-crack-time').html timeToCrack
      progressBar.css('width', strength + '%')
      progressBar.attr('aria-valuenow', strength)
      $('#password-strength').html "Password Strengh: #{strength}%"

      switch score
        when 2
          setProgressBar(progressBar, 'success')
          iconOk('password-security')
        when 3
          setProgressBar(progressBar, 'warning')
          iconOk('password-security')
        when 4
          setProgressBar(progressBar, 'danger')
          iconOk('password-security')
        else
          setProgressBar(progressBar, 'info')
          iconNo('password-security')

      if score >= MINIMUM_SCORE then true else false

  checkMatch = ->
    $('#password').val() is $('#password-confirmation').val()
  
  confirmationEmpty = ->
    $('#password-confirmation').val() is ""

  disableSubmit = ->
    $('#submit-password').attr('disabled', true)
  enableSubmit = ->
    $('#submit-password').attr('disabled', false)

  $('#password').keyup ->
    checkPasswordStrength()

  $('.input-field').keyup ->
    if confirmationEmpty()
      iconRemove('password-match')
    else if checkMatch()
      iconOk('password-match')
    else
      iconNo('password-match')
    
    if checkMatch() and checkPasswordStrength()
      enableSubmit()
    else
      disableSubmit()

