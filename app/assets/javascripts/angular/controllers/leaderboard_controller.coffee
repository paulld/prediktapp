predikt.controller 'LeaderboardCtrl', ($scope, $http) ->
  $http.get('./api/users').success (data) ->
    $scope.users = data.users