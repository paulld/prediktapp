predikt.controller 'UpcomingMatchesCtrl', ($scope, $http, User, Bet, Message) ->
  $http.get(
    './api/matches?game_started=false&sort=starts_at&recent=10'
  ).success (data) ->
    
    $scope.matches = data.matches
    
    $scope.profile = null
    User.getUser().then (result) ->
      $scope.profile = result.data.users[0]

    $scope.clickToBet = (matchId, betType, odds, wager) ->
      if $scope.profile
        console.log 'need to place', wager, ' on ', betType, '(odds: ', odds, ') for user ', $scope.profile.id, 'on match id: ', matchId

        Bet.create($scope.profile.id, matchId, betType, odds, wager)
      else
        Message.noty('Please log in to place a bet.', 'error', 700)
