predikt.controller 'leaderboardCtrl', ["$scope", "$http", ($scope, $http) ->
  $http.get('./api/leaderboard').success (data) ->
    $scope.users = data
    
    for user in $scope.users
      user.hasWins = user.wins and (user.wins * 1 > 0)
      user.hasLosses = user.losses and (user.losses * 1 > 0)

      if (user.hasWins is true) or (user.hasLosses is true)
        user.hasResults = true
        user.winPercent = (user.wins * 100) / (user.wins * 1 + user.losses * 1)
      else
        user.hasResults = false
        user.winPercent = 0

      user.followers *= 1
      user.coins *= 1
      user.tries *= 1
      user.wins *= 1
      user.losses *= 1
]
