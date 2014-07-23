predikt.controller 'dashboardProfileCtrl', ($scope, $http, $location, $routeParams, $route, User) ->

  $scope.profile = null
  User.getCurrentUser().then (result) ->
    $scope.profile = result.data.users[0]

    User.getUserBets($scope.profile.id).success (betData) ->
      $scope.bets = betData.bets

    $('button').on 'click', (e) ->
      console.log 'hi'
      setTimeout( () ->
        User.getCurrentUser().then (result) ->
            $scope.profile = result.data.users[0]
            
            User.getUserBets($scope.profile.id).success (betData) ->
              $scope.bets = betData.bets
      , 500)
    
  $scope.viewEditProfile = () ->
    $location.url '/my-profile/edit'    
