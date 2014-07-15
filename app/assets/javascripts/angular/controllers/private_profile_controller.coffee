predikt.controller 'PrivateProfileCtrl', ($scope, $http, $routeParams) ->

  $http.get('./api/profile/' ).success (userData) ->
    $scope.profile = userData.users[0]

    $http.get('./api/users/' + $scope.profile.id + '/bets').success (betData) ->
      $scope.bets = betData.bets

      for bet in $scope.bets
        bet.status = bet.links.match.match_status
        # bet.starts_at = bet.links.match.match_starts_at
        # bet.ends_at = bet.links.match.match_ends_at
