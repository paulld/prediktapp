predikt.controller 'PrivateProfileCtrl', ($scope, $http, $routeParams) ->

  $http.get('./api/profile/' ).success (userData) ->
    $scope.profile = userData.users[0]

    # arrayOfBetIds = $scope.profile.links.bets
    
    stringOfBetIds = ''
    $scope.allBets = []

    arrayOfBetIds = try
      $scope.profile.links.bets
    catch
      []

    if arrayOfBetIds.length > 0
      stringOfBetIds = arrayOfBetIds[0]
      if arrayOfBetIds.length > 1
        for i in [1...arrayOfBetIds.length]
          stringOfBetIds = "#{stringOfBetIds},#{arrayOfBetIds[i]}"

      $http.get('./api/bets/' + stringOfBetIds ).success (betData) ->
        $scope.allBets = betData.bets

        for bet in $scope.allBets
          bet.status = bet.links.match.match_status
