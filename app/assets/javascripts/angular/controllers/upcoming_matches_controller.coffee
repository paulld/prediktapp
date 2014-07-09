predikt.controller 'UpcomingMatchesCtrl', ($scope, $http) ->
  $http.get('./api/matches?game_started=false&sort=starts_at&recent=10').success (data) ->
    $scope.matches = data.matches
