predikt.controller 'PublicProfileCtrl', ($scope, $http, $routeParams, User, Message) ->
  
  userId = $routeParams.userId
  
  $http.get('./api/users/' + userId ).success (userData) ->
    $scope.user = userData.users[0]

    $http.get('./api/users/' + userId + '/bets').success (betData) ->
      $scope.bets = betData.bets

      for bet in $scope.bets
        bet.status = bet.links.match.match_status
        # bet.starts_at = bet.links.match.match_starts_at
        # bet.ends_at = bet.links.match.match_ends_at
          

    $scope.profile = null
    User.getUser().then (result) ->
      $scope.profile = result.data.users[0]

    $scope.follow = (userId) ->

      if $scope.profile
        console.log $scope.profile.id, "wants to follow", userId
        User.follow($scope.profile.id, userId)
        # TODO: PUT to create following
      else
        Message.noty('Please log in to follow.', 'error', 700)

      
      # $http.put('./api/users').success (u)      
   


  # GENERATE RANDOM PROFILE PICTURE (TEMPORARY):
    $http.get('http://api.randomuser.me/' ).success (randomUser) ->
      $scope.randomPicture = randomUser.results[0].user.picture
