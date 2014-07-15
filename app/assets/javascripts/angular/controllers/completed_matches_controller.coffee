predikt.controller 'CompletedMatchesCtrl', ($scope, $http) ->
  $http.get('./api/matches/past?sort=ends_at&recent=10').success (data) ->
    $scope.matches = data.matches
