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
    
  $scope.viewEditProfile = () ->
    $location.url '/my-profile/edit'    
]
