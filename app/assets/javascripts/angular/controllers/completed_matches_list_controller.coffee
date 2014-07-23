predikt.controller 'completedMatchesListCtrl', ($scope, $http, User) ->
  $http.get('./api/matches/past?sort=ends_at&recent=10').success (data) ->
    $scope.matches = data.matches
    
    $scope.completedMatchView = { url: 'assets/matches/completed_match_buttons.html' }
    
    for match in $scope.matches
      if match.handicap_side is 'home'
        match.homeHandicap = "-#{match.handicap_value}"
        match.awayHandicap = "+#{match.handicap_value}"
      else
        match.homeHandicap = "+#{match.handicap_value}"
        match.awayHandicap = "-#{match.handicap_value}"

  $scope.profile = null
  User.getCurrentUser().then (result) ->
    $scope.profile = result.data.users[0]
