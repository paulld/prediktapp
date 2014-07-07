predikt.controller 'UpcomingMatchesListCtrl', ($scope, $http) ->
  $http.get('./api/matches').success (data) ->
    $scope.matches = data.matches
    $scope.matchDay =
      moment(data.matches[0].starts_at).format('MM/DD/YYYY')
    $scope.matchStartTime =
      moment(data.matches[0].starts_at).format('HH:mm A')