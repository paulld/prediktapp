predikt.controller 'completedMatchItemCtrl', ["$scope", "$http", "$routeParams", "User", ($scope, $http, $routeParams, User) ->

  matchId = $routeParams.matchId
  
  $http.get('./api/matches/' + matchId ).success (matchData) ->
    $scope.match = matchData.matches[0]
    
    if $scope.match.handicap_side is 'home'
      $scope.match.homeHandicap = "-#{$scope.match.handicap_value}"
      $scope.match.awayHandicap = "+#{$scope.match.handicap_value}"
    else
      $scope.match.homeHandicap = "+#{$scope.match.handicap_value}"
      $scope.match.awayHandicap = "-#{$scope.match.handicap_value}"

  $scope.profile = null
  User.getCurrentUser().then (result) ->
    $scope.profile = result.data.users[0]
]
