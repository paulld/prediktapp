predikt.controller 'dashboardProfileCtrl', ($scope, $http, $location, $routeParams, $route, User) ->

  $scope.profile = null
  User.getCurrentUser().then (result) ->
    $scope.profile = result.data.users[0]

    $http.get('./api/users/' + $scope.profile.id + '/bets').success (betData) ->
      $scope.bets = betData.bets

      for bet in $scope.bets
        bet.status = bet.links.match.match_status
        # bet.starts_at = bet.links.match.match_starts_at
        # bet.ends_at = bet.links.match.match_ends_at

  $scope.viewEditProfile = () ->
    $location.url '/my-profile/edit'

  $('button').on 'click', (e) ->
    setTimeout( () ->
      User.getCurrentUser().then (result) ->
        $scope.profile = result.data.users[0]

        $http.get('./api/users/' + $scope.profile.id + '/bets').success (betData) ->
          $scope.bets = betData.bets

          for bet in $scope.bets
            bet.status = bet.links.match.match_status
      console.log 'I WAITED'
    , 500)
  