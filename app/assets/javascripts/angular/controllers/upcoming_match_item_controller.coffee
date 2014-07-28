predikt.controller 'upcomingMatchItemCtrl', ["$scope", "$http", "$routeParams", "User", "Bet", "Message", ($scope, $http, $routeParams, User, Bet, Message) ->

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
      if !$scope.profile
        Message.noty('Please log in to place a bet.', 'error', 1500)
      else
        if newBetData.wager.$modelValue > $scope.profile.coins
          Message.noty("You don't have sufficient coins.", 'error', 1500)
        else
          if !(0 < newBetData.wager.$modelValue < 51)
            Message.noty('Please input a wager value<br>between 1 and 50 coins.', 'error', 2000)
          else
            Bet.create($scope.profile.id, matchId, homeTeam, awayTeam, betType, odds, newBetData.wager.$modelValue).success ->
              $('.form-wager-select').val('')
              User.getCurrentUser().then (result) ->
                $scope.profile = result.data.users[0]
                      
]
