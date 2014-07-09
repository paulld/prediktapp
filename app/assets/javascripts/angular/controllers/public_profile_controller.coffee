predikt.controller 'PublicProfileCtrl', ($scope, $http, $routeParams) ->
  
  userId = $routeParams.userId
  
  $http.get('./api/users/' + userId ).success (data) ->
    $scope.user = data.users[0]

    # console.log $scope.user.links.bets
    # betIds = $scope.user.links.bets
    
  # $http.get('./api/bets').success (data) ->
  #   $scope.bets = data.bets[0]

  # $http.get('./api/matches').success (data) ->
  #   $scope.matches = data.matches[0]     

