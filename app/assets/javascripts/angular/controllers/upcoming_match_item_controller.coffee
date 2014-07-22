predikt.controller 'upcomingMatchItemCtrl', ($scope, $http, $routeParams, User, Bet, Message) ->

  matchId = $routeParams.matchId
  
  $http.get('./api/matches/' + matchId ).success (matchData) ->
    $scope.match = matchData.matches[0]
    
    if $scope.match.handicap_side is 'home'
      console.log 'home'
      $scope.match.homeHandicap = "-#{$scope.match.handicap_value}"
      $scope.match.awayHandicap = "+#{$scope.match.handicap_value}"
    else
      $scope.match.homeHandicap = "+#{$scope.match.handicap_value}"
      $scope.match.awayHandicap = "-#{$scope.match.handicap_value}"

    $scope.profile = null
    User.getCurrentUser().then (result) ->
      $scope.profile = result.data.users[0]

      $scope.wagerData = [{id: 1, text: "1 coin"}]
      for i in [2..50]
        $scope.wagerData.push {id: i, text: "#{i} coins"}

      $('.wager-select').select2(
        data: $scope.wagerData
      ).select2('val', '1')


    $scope.clickToBet = (matchId, homeTeam, awayTeam, betType, odds, wager) ->
      if $scope.profile
        Bet.create($scope.profile.id, matchId, homeTeam, awayTeam, betType, odds, wager)
      else
        Message.noty('Please log in to place a bet.', 'error', 700)