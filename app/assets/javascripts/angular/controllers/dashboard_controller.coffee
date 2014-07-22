predikt.controller 'dashboardProfileCtrl', ($scope, $http, $location, $routeParams, $route, User) ->

  $scope.profile = null
  User.getCurrentUser().then (result) ->
    $scope.profile = result.data.users[0]

    User.getUserBets($scope.profile.id).success (betData) ->
      $scope.bets = betData.bets

  $scope.viewEditProfile = () ->
    $location.url '/my-profile/edit'

  $('button').on 'click', (e) ->
    setTimeout( () ->
      User.getCurrentUser().then (result) ->
          $scope.profile = result.data.users[0]
          
          User.getUserBets($scope.profile.id).success (betData) ->
            $scope.bets = betData.bets
    , 500)
  