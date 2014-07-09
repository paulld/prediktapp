predikt.controller 'CompletedMatchesListCtrl', ($scope, $http) ->
  $http.get('./api/matches?recent=2').success (data) ->
    $scope.matches = data.matches
