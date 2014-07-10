predikt.controller 'PublicProfileCtrl', ($scope, $http, $routeParams) ->
  
  userId = $routeParams.userId
  
  $http.get('./api/users/' + userId ).success (userData) ->
    $scope.user = userData.users[0]

    betIds = $scope.user.links.bets
    
    allBetIds = ''
    if betIds.length > 0
      for bet in betIds
        allBetIds = "#{allBetIds},#{bet}"

      $http.get('./api/bets/#{allBetIds}' ).success (betData) ->
        # console.log betData.bets
        $scope.allBets = betData.bets
        console.log $scope.allBets


  # $http.get('./api/matches').success (data) ->
  #   $scope.matches = data.matches[0]     


  # GENERATE RANDOM PROFILE PICTURE (TEMPORARY):
    $http.get('http://api.randomuser.me/' ).success (randomUser) ->
      $scope.randomPicture = randomUser.results[0].user.picture
