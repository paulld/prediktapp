predikt.controller 'upcomingMatchesListCtrl', ($scope, $http, User, Bet, Message) ->
  
  $http.get( './api/matches/future?sort=starts_at&recent=10').success (data) ->
    $scope.matches = data.matches
    
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
      
      $scope.wagerData = [{id: 1, text: "1 coin"}]
      for i in [2..50]
        $scope.wagerData.push {id: i, text: "#{i} coins"}

      $('.wager-select').select2(
        data: $scope.wagerData
      ).select2('val', '1')


    $scope.clickToBet = (matchId, homeTeam, awayTeam, betType, odds, wager, selectedWager) ->
      console.log selectedWager
      # console.log selectedWager.wager_hda.$modelValue
      if $scope.profile
        Bet.create($scope.profile.id, matchId, homeTeam, awayTeam, betType, odds, wager)
        Bet.changed = 'changed'
      else
        Message.noty('Please log in to place a bet.', 'error', 700)
