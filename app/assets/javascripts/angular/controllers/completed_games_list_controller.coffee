predikt.controller 'CompletedMatchesListCtrl', ($scope, $http) ->
  $http.get('./api/matches').success (data) ->
    $scope.matches = data.matches
    $scope.matchEndTime =
      moment(data.matches.ends_at).format('LLL')

