predikt.controller 'PrivateProfileCtrl', ($scope, $http, $routeParams) ->
  
  userId = $routeParams.userId

  $http.get('./api/profile/' ).success (userData) ->
    $scope.profile = userData.users[0]

    betIds = $scope.user.links.bets

    allBetIds = ''
    if betIds.length > 0
      for bet in betIds
        allBetIds = "#{allBetIds},#{bet}"

      $http.get('./api/bets/#{allBetIds}' ).success (betData) ->
        # console.log betData.bets
        $scope.allBets = betData.bets
        console.log $scope.allBets
