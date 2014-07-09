predikt.controller 'ProfileCtrl', ($scope, $http) ->
  $http.get('./api/profile').success (data) ->
    $scope.profile = data.users[0]
