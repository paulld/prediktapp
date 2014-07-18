predikt.controller 'upcomingMatchItemCtrl', ($scope, $http, $routeParams, User, Bet, Message) ->

  matchId = $routeParams.matchId
  
  $http.get('./api/matches/' + matchId ).success (matchData) ->
    $scope.match = matchData.matches[0]

    $scope.profile = null
    User.getCurrentUser().then (result) ->
      $scope.profile = result.data.users[0]

    $scope.clickToBet = (matchId, betType, odds, wager) ->
      if $scope.profile
        console.log 'need to place', wager, ' on ', betType, '(odds: ', odds, ') for user ', $scope.profile.id, 'on match id: ', matchId

        Bet.create($scope.profile.id, matchId, betType, odds, wager)
      else
        Message.noty('Please log in to place a bet.', 'error', 700)
