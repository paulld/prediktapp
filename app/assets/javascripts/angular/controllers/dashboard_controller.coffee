predikt.controller 'dashboardProfileCtrl', ($scope, $http, $location, $routeParams, $route, User) ->

  $scope.profile = null
  User.getCurrentUser().then (result) ->
    $scope.profile = result.data.users[0]

    User.getUserBets($scope.profile.id).success (betData) ->
      $scope.bets = betData.bets

    $('button').on 'click', (e) ->
      setTimeout( () ->
        User.getCurrentUser().then (result) ->
            $scope.profile = result.data.users[0]
            
            User.getUserBets($scope.profile.id).success (betData) ->
              $scope.bets = betData.bets
        $('.dashboard-bet-line:first-of-type').addClass('dashboard-highlight')
      , 500)
      # setTimeout( () ->
      #   # $('.dashboard-bet-line:first-of-type').addClass('dashboard-highlight')
      # , 1500)
    
  $scope.viewEditProfile = () ->
    $location.url '/my-profile/edit'    
