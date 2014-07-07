predikt.controller 'UpcomingMatchesListCtrl', ($scope, $http) ->
  $http.get('./api/matches').success (data) ->
    $scope.matches = data.matches
    $scope.matchStartTime =
      moment(data.matches.starts_at).format('LLL')
