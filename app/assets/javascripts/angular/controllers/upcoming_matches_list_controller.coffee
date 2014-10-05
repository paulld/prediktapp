predikt.controller 'upcomingMatchesListCtrl', ["$scope", "$http", "User", "Bet", "Message", ($scope, $http, User, Bet, Message) ->
  
  $http.get( './api/matches/future?sort=starts_at&recent=10').success (data) ->
    $scope.matches = data.matches

    # $('input .form-wager-select').on 'focusin', (e) ->
    #   console.log 'hi'
    #   $(@).attr('placeholder','')
    
    for match in $scope.matches
      if match.handicap_side is 'home'
        match.homeHandicap = "-#{match.handicap_value}"
        match.awayHandicap = "+#{match.handicap_value}"
      else
        match.homeHandicap = "+#{match.handicap_value}"
        match.awayHandicap = "-#{match.handicap_value}"

    $scope.profile = null
    $http.get('./api/profile/' ).success (resultData) ->
      if ! resultData.users[0]
        $scope.profile = null
      else
        $scope.profile = resultData.users[0]

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
