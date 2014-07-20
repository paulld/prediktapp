predikt.controller 'upcomingMatchItemCtrl', ($scope, $http, $routeParams, User, Bet, Message) ->

  matchId = $routeParams.matchId
  
  $http.get('./api/matches/' + matchId ).success (matchData) ->
    $scope.match = matchData.matches[0]

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
      coins = if wager is 1 then 'coin' else 'coins'
      successMessage = 'You placed '+ wager + ' ' + coins + ' on a bet: <br>' + homeTeam + '-' + awayTeam + ' (' + betType + ')'

      if $scope.profile
        Bet.create($scope.profile.id, matchId, betType, odds, wager)
          .success () ->
            Message.noty(successMessage, 'success', 2000)
          .error () ->
            Message.noty('Something went wrong! Please try again.', 'error', 700)    
      else
        Message.noty('Please log in to place a bet.', 'error', 700)
