predikt.controller 'completedMatchItemCtrl', ($scope, $http, $routeParams, User) ->

  matchId = $routeParams.matchId
  
  $http.get('./api/matches/' + matchId ).success (matchData) ->
    $scope.match = matchData.matches[0]

  $scope.profile = null
  User.getCurrentUser().then (result) ->
    $scope.profile = result.data.users[0]
