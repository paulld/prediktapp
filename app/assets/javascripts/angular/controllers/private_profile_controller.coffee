predikt.controller 'PrivateProfileCtrl', ($scope, $http) ->
  $http.get('./api/profile').success (data) ->
    $scope.profile = data.users[0]

    
    # betIds = []
  # $http.get('./api/users').success (data) ->
  #   $scope.users = data.users[0]


  # $http.get('./api/bets').success (data) ->
  #   $scope.bets = data.bets[0]

  # $http.get('./api/matches').success (data) ->
  #   $scope.matches = data.matches[0]  