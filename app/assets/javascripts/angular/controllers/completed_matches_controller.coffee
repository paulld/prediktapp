predikt.controller 'completedMatchesCtrl', ($scope, $http, User) ->
  $http.get('./api/matches/past?sort=ends_at&recent=10').success (data) ->
    $scope.matches = data.matches

  $scope.profile = null
  User.getCurrentUser().then (result) ->
    $scope.profile = result.data.users[0]
