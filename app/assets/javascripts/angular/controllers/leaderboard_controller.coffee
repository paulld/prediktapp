predikt.controller 'leaderboardCtrl', ($scope, $http) ->
  $http.get('./api/leaderboard').success (data) ->
    $scope.users = data
    
    for user in $scope.users
      user.win_percent = if (user.wins + user.losses) > 0
        Math.round(user.wins * 100 / (user.wins + user.losses)).toFixed(1)
      else
        "na"