predikt.controller 'CompletedMatchesCtrl', ($scope, $http) ->
  $http.get('./api/matches?game_ended=true&sort=ends_at&recent=10').success (data) ->
    $scope.matches = data.matches
