predikt.controller 'dashboardCtrl', ["$scope", "$http", "$location", "$routeParams", "$route", "User", ($scope, $http, $location, $routeParams, $route, User) ->

  $scope.profile = null
  $http.get('./api/profile/' ).success (resultData) ->
    if ! resultData.users[0]
      $scope.profile = null
    else
      $scope.profile = resultData.users[0]

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

      $('.show-button button').on 'click', (e) ->
        console.log 'hi'
      # $('.show-button').on 'click', (e) ->
      #   $('#' + e.currentTarget.id + '-data').toggleClass('hide')
    
  $scope.viewEditProfile = () ->
    $location.url '/my-profile/edit'    
]
