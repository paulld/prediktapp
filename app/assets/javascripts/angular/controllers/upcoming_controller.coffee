predikt.controller 'UpcomingMatchesListCtrl', ($scope, $http) ->
  $scope.hey = "Upcoming!"

  $http.get('./api/matches').success (data) ->
    $scope.matches = data.matches
