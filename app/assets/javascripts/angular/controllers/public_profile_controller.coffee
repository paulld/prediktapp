predikt.controller 'PublicProfileCtrl', ($scope, $http, $routeParams) ->
  
  userId = $routeParams.userId
  
  $http.get('./api/users/' + userId ).success (userData) ->
    $scope.user = userData.users[0]

    arrayOfBetIds = $scope.user.links.bets
    
    stringOfBetIds = ''
    $scope.allBets = []

    if arrayOfBetIds.length > 0
      stringOfBetIds = arrayOfBetIds[0]
      if arrayOfBetIds.length > 1
        for i in [1...arrayOfBetIds.length]
          stringOfBetIds = "#{stringOfBetIds},#{arrayOfBetIds[i]}"

      $http.get('./api/bets/' + stringOfBetIds ).success (betData) ->
        $scope.allBets = betData.bets


  # $http.get('./api/matches').success (data) ->
  #   $scope.matches = data.matches[0]     


  # GENERATE RANDOM PROFILE PICTURE (TEMPORARY):
    $http.get('http://api.randomuser.me/' ).success (randomUser) ->
      $scope.randomPicture = randomUser.results[0].user.picture
