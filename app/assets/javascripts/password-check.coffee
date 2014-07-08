$ ->

  MINIMUM_SCORE = 2

  iconOk = ->
    $('#password-match').removeClass('fa-times password-match-no')
    $('#password-match').addClass('fa-check password-match-ok')
  iconNo = ->
    $('#password-match').addClass('fa-times password-match-no')
    $('#password-match').removeClass('fa-check password-match-ok')
  iconRemove = ->
    $('#password-match').removeClass('fa-check password-match-ok fa-times password-match-no')
  
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
        when 3
          setProgressBar(progressBar, 'warning')
        when 4
          setProgressBar(progressBar, 'danger')
        else
          setProgressBar(progressBar, 'info')

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
      iconRemove()
    else if checkMatch()
      iconOk()
    else
      iconNo()
    
    if checkMatch() and checkPasswordStrength()
      enableSubmit()
    else
      disableSubmit()

