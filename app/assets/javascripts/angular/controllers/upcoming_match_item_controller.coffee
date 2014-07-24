predikt.controller 'upcomingMatchItemCtrl', ($scope, $http, $routeParams, User, Bet, Message) ->

  matchId = $routeParams.matchId
  
  $http.get('./api/matches/' + matchId ).success (matchData) ->
    $scope.match = matchData.matches[0]
    
    $scope.upcomingMatchView = { url: 'assets/matches/upcoming_match_buttons.html' }
    
    if $scope.match.handicap_side is 'home'
      $scope.match.homeHandicap = "-#{$scope.match.handicap_value}"
      $scope.match.awayHandicap = "+#{$scope.match.handicap_value}"
    else
      $scope.match.homeHandicap = "+#{$scope.match.handicap_value}"
      $scope.match.awayHandicap = "-#{$scope.match.handicap_value}"

    $scope.profile = null
    User.getCurrentUser().then (result) ->
      $scope.profile = result.data.users[0]

      # wagerData = [{id: 1, text: "1 coin"}]
      # for i in [2..50]
      #   wagerData.push {id: i, text: "#{i} coins"}

      # $('.wager-select').select2(
      #   data: wagerData
      # ).select2('val', '1')


    $scope.clickToBet = (matchId, homeTeam, awayTeam, betType, odds, newBetData) ->
      if newBetData.wager_hda.$modelValue > 0 && newBetData.wager_hda.$modelValue < 51
        if $scope.profile
          Bet.create($scope.profile.id, matchId, homeTeam, awayTeam, betType, odds, newBetData.wager_hda.$modelValue).success ->
            $('.form-wager-select').val('')
        else
          Message.noty('Please log in to place a bet.', 'error', 700)
      else
        Message.noty('Please input a wager value<br>between 1 and 50 coins.', 'error', 2000)

    