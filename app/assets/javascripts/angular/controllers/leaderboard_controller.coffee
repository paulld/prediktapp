predikt.controller 'LeaderboardCtrl', ($scope, $http) ->
  $http.get('./api/users').success (data) ->
    $scope.users = data.users

    for user in data.users
      $scope.bets = user.links.bets
      user.numberOfBets = $scope.bets.length




      # console.log user.user_name, '-', user.links.bets

      # user.numberOfWins = 0
      # user.numberOfLoss = 0
      # user.numberOfPending = 0

###
      for bet in user.links.bets
        $http.get('./api/bets/' + bet).success (data) ->
          # console.log user.user_name, '-', data.bets[0].bet_type, '-', data.bets[0].result

          if data.bets[0].result is true
            user.numberOfWins += 1
          else if data.bets[0].result is false
            user.numberOfLoss += 1
          else
            user.numberOfPending += 1
          # console.log user.user_name
          # console.log user.user_name, '- numberOfWins', user.numberOfWins
          # console.log user.user_name, '- numberOfLoss', user.numberOfLoss
          # console.log user.user_name, '- numberOfPending', user.numberOfPending

          ###