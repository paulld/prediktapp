$ ->
  unsetActive = () ->
    $('#header-navlinks').children().removeClass('active')

  setActive = (lnk) ->
    lnk = $(lnk)
    unsetActive()
    lnk.addClass('active')

  $('#header-navlinks li').on 'click', (e) ->
    setActive(@)

  $('.navbar-brand').on 'click', (e) ->
    setActive('#home-link')

  $('#login-buttons li').on 'click', (e) ->
    unsetActive()

  $('#footer-navlinks li').on 'click', (e) ->
    unsetActive()