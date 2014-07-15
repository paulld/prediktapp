$ ->
  unsetActive = () ->
    $('#header-navlinks, #login-buttons').children().removeClass('active')

  setActive = (lnk) ->
    lnk = $(lnk)
    unsetActive()
    lnk.addClass('active')

  $('#header-navlinks li').on 'click', (e) ->
    setActive(@)

  $('.navbar-brand').on 'click', (e) ->
    unsetActive()

  $('#profile-link').on 'click', (e) ->
    setActive(@)

  $('#footer-navlinks li').on 'click', (e) ->
    unsetActive()