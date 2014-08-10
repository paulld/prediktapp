predikt.controller 'adminMatchItemCtrl', ["$scope", "$http", "$location", "$routeParams", "$route", "Match", "Message", ($scope, $http, $location, $routeParams, $route, Match, Message) ->
  
  # TODO: CHECK IF ADMIN!

  matchId = $routeParams.matchId

  $http.get('./api/matches/' + matchId ).success (matchData) ->
    $scope.match = matchData.matches[0]
    $scope.isCompleted = if $scope.match.match_status is 'completed' then true else false

  $http.get('./api/matches/' + matchId + '/bets').success (betData) ->
    $scope.bets = betData.bets
    for bet in $scope.bets
      bet.is_successful = switch
        when bet.is_successful is true then 'WIN'
        when bet.is_successful is false then 'LOSS'
        else 'pending'

  $scope.setComplete = (formData) ->
    if formData.home_score.$pristine or formData.away_score.$pristine
      # TODO: Check if scores are integer
      Message.noty("Please fill the final score.", 'error', 1000)
    else
      Match.setComplete(
        matchId,
        formData.home_score.$modelValue,
        formData.away_score.$modelValue,
        $scope.match.over_under_value,
        $scope.match.handicap_value,
        $scope.match.handicap_side
      ).success () ->
        $route.reload()

  $scope.unsetComplete = () ->
    Match.unsetComplete(matchId).success () ->
      $route.reload()

  $scope.settle = () ->
    Match.settle(matchId)
      # TODO: Reload page
]
