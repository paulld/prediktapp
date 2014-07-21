predikt.controller 'adminMatchCtrl', ($scope, $http, $routeParams, Message) ->
  
  # TODO: CHECK IF ADMIN!

  matchId = $routeParams.matchId

  $http.get('./api/matches/' + matchId ).success (matchData) ->
    $scope.match = matchData.matches[0]

  $http.get('./api/matches/' + matchId + '/bets').success (betData) ->
    $scope.bets = betData.bets

  $scope.submit = (formData) ->
    if formData.home_score.$pristine or formData.away_score.$pristine
      Message.noty("Please fill the final score.", 'error', 1000)
    else
      console.log 'HOME: ', formData.home_score.$modelValue
      console.log 'AWAY: ', formData.away_score.$modelValue


  $scope.settle = () ->
    console.log 'MATCH ID: ', matchId
