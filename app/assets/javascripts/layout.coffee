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

  $('.nav.navbar-nav').on 'click', (e) ->
    $('.navbar-collapse.collapse.in').removeClass('in')
  $('main').on 'click', (e) ->
    $('.navbar-collapse.collapse.in').removeClass('in')
