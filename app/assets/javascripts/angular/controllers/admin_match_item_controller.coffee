predikt.controller 'adminMatchItemCtrl', ($scope, $http, $location, $routeParams, $route, Match, Message) ->
  
  # TODO: CHECK IF ADMIN!

  matchId = $routeParams.matchId

  $http.get('./api/matches/' + matchId ).success (matchData) ->
    $scope.match = matchData.matches[0]
    $scope.isCompleted = if $scope.match.match_status is 'completed' then true else false

  $http.get('./api/matches/' + matchId + '/bets').success (betData) ->
    $scope.bets = betData.bets


  $scope.setComplete = (formData) ->
    if formData.home_score.$pristine or formData.away_score.$pristine
      Message.noty("Please fill the final score.", 'error', 1000)
    else
      Match.setComplete(matchId, formData.home_score.$modelValue, formData.away_score.$modelValue).success () ->
        $route.reload()

  $scope.unsetComplete = () ->
    Match.unsetComplete(matchId).success () ->
      $route.reload()

  $scope.settle = () ->
    console.log 'MATCH ID: ', matchId
