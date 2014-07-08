$ ->
  $('.login-form-selector').on 'click', 'li', (e) ->
    # e.preventDefault
    $(@).parent().children().removeClass('active')
    $(@).addClass('active')

    switch $(@).attr('id')
      when 'login-form-login'
        $('#login-input-password').show()
        $('#login legend').html('Please log in')
        $('#submit-button').val('Log in')
        $('#user_login_form_type').val('login')

      when 'login-form-signup'
        $('#login-input-password').hide()
        $('#login legend').html('Please sign up')
        $('#submit-button').val('Sign up')
        $('#user_login_form_type').val('signup')

      when 'login-form-reset'
        $('#login-input-password').hide()
        $('#login legend').html('Reset your password')
        $('#submit-button').val('Reset password')
        $('#user_login_form_type').val('reset')