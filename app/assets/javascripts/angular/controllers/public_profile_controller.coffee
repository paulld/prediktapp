predikt.controller 'PublicProfileCtrl', ($scope, $http, $routeParams, User) ->
  
  userId = $routeParams.userId
  
  $http.get('./api/users/' + userId ).success (userData) ->
    $scope.user = userData.users[0]

    arrayOfBetIds = $scope.user.links.bets
    
    arrayOfBetIds = try
      $scope.user.links.bets
    catch
      []
    
    stringOfBetIds = ''
    $scope.allBets = []

    if arrayOfBetIds.length > 0
      stringOfBetIds = arrayOfBetIds[0]
      if arrayOfBetIds.length > 1
        for i in [1...arrayOfBetIds.length]
          stringOfBetIds = "#{stringOfBetIds},#{arrayOfBetIds[i]}"

      $http.get('./api/bets/' + stringOfBetIds ).success (betData) ->
        $scope.allBets = betData.bets

        for bet in $scope.allBets
          bet.status = bet.links.match.match_status
          

    $scope.profile = null
    User.getUser().then (result) ->
      $scope.profile = result.data.users[0]

    $scope.follow = (userId) ->

      if $scope.profile
        alert "now following"
        console.log $scope.profile.id, "wants to follow", userId
      else
        alert "Please log in to follow"   

      
      # $http.put('./api/users').success (u)      
   


  # GENERATE RANDOM PROFILE PICTURE (TEMPORARY):
    $http.get('http://api.randomuser.me/' ).success (randomUser) ->
      $scope.randomPicture = randomUser.results[0].user.picture
