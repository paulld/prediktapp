predikt.controller 'adminMatchCtrl', ($scope, $http, $routeParams, User, Bet, Message) ->
  
  matchId = $routeParams.matchId

  $http.get('./api/matches/' + matchId ).success (matchData) ->
    $scope.match = matchData.matches[0]

  $http.get('./api/matches/' + matchId + '/bets').success (betData) ->
    $scope.bets = betData.bets

