predikt.controller 'UpcomingMatchesListCtrl', ($scope, $http) ->
  $http.get('./api/matches').success (data) ->
    $scope.matches = data.matches
