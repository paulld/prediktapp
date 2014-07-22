predikt.controller 'publicProfileCtrl', ($scope, $http, $routeParams, User, Message) ->
  
  userId = $routeParams.userId
  
  User.getUser(userId).then (result) ->
    $scope.user = result.data.users[0]

    User.getUserBets($scope.user.id).success (betData) ->
      $scope.bets = betData.bets

      for bet in $scope.bets
        bet.status = bet.links.match.match_status
        # bet.starts_at = bet.links.match.match_starts_at
        # bet.ends_at = bet.links.match.match_ends_at
          

    $scope.profile = null
    User.getCurrentUser().then (result) ->
      $scope.profile = result.data.users[0]

    $scope.follow = (userId) ->
      if $scope.profile
        User.createFollow($scope.profile.id, userId, $scope.user.user_name)
      else
        Message.noty('Please log in to follow.', 'error', 700)
