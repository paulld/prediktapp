predikt.controller 'leaderboardCtrl', ($scope, $http) ->
  $http.get('./api/leaderboard').success (data) ->
    $scope.users = data
    
    for user in $scope.users
      user.hasWins = user.wins and (user.wins * 1 > 0)
      user.hasLosses = user.losses and (user.losses * 1 > 0)
      # console.log user.hasLosses
      # console.log user.hasWins


      if (user.hasWins is true) or (user.hasLosses is true)
        console.log user.user_name
        # console.log 'yes'
        user.hasResults = true
        console.log user.winPercent = (user.wins * 100) / (user.wins * 1 + user.losses * 1)
      else
        # console.log 'no'
        user.hasResults = false
        user.winPercent = 0
