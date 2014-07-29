predikt.controller 'dashboardProfileCtrl', ["$scope", "$http", "$location", "$routeParams", "$route", "User", ($scope, $http, $location, $routeParams, $route, User) ->

  $scope.profile = null
  User.getCurrentUser().then (result) ->
    $scope.profile = result.data.users[0]

    User.getUserBets($scope.profile.id).success (betData) ->
      $scope.bets = betData.bets

      for bet in $scope.bets
        if bet.bet_type is 'home_handicap' then bet.bet_type = 'home handicap'
        if bet.bet_type is 'away_handicap' then bet.bet_type = 'away handicap'

    $('.game-buttons button').on 'click', (e) ->
      setTimeout( () ->
        User.getCurrentUser().then (result) ->
            $scope.profile = result.data.users[0]
            
            User.getUserBets($scope.profile.id).success (betData) ->
              $scope.bets = betData.bets
              for bet in $scope.bets
                  if bet.bet_type is 'home_handicap' then bet.bet_type = 'home handicap'
                  if bet.bet_type is 'away_handicap' then bet.bet_type = 'away handicap'
      , 500)
      setTimeout( () ->
        $('.dashboard-bet-line:first-of-type').addClass('dashboard-highlight')
      , 700)
      setTimeout( () ->
        $('.dashboard-bet-line:first-of-type').removeClass('dashboard-highlight')
      , 1000)


    $('.show-button').on 'click', (e) ->
      $('#' + e.currentTarget.id + '-data').toggleClass('hide')
    # $('.show-button').on 'click', (e) ->
    #   console.log 'show'
    #   $('#' + e.currentTarget.id + '-data').removeClass('hide')
    #   $('.show-button').addClass('hide-button').removeClass('show-button').html('hide')

    # $('.hide-button').on 'click', (e) ->
    #   console.log 'hide'
    #   $('#' + e.currentTarget.id + '-data').addClass('hide')
    #   $('.hide-button').addClass('show-button').removeClass('hide-button').html('show more')
    
  $scope.viewEditProfile = () ->
    $location.url '/my-profile/edit'    
]
