predikt.controller 'privateProfileCtrl', ["$scope", "$http", "$location", "$routeParams", "User", ($scope, $http, $location, $routeParams, User) ->

  $scope.profile = null
  User.getCurrentUser().then (result) ->
    $scope.profile = result.data.users[0]

    User.getUserBets($scope.profile.id).success (betData) ->
      $scope.bets = betData.bets

      for bet in $scope.bets
        switch bet.status = bet.links.match.match_status
          when 'pending' then $scope.hasPendingBets = true
          when 'ongoing' then $scope.hasOngoingBets = true
          when 'completed' then $scope.hasCompletedBets = true
        bet.bet_type = switch
          when bet.bet_type is 'home_handicap' then 'home handicap'
          when bet.bet_type is 'away_handicap' then 'away handicap'

    User.getUserCoinTransactions($scope.profile.id).success (transactionData) ->
      $scope.coinTransactions = transactionData.coin_transactions
      if $scope.coinTransactions.length > 0 then $scope.hasCoinTransactions = true
            
      for transaction in $scope.coinTransactions
        switch transaction.transaction_type
          when 'init' then transaction.transaction_type = 'Awarded at sign up'
          when 'place_bet' then transaction.transaction_type = 'Placed a new bet'
          when 'win_bet' then transaction.transaction_type = 'Won a bet'


    User.getLeaderboardData().success (leaderboardData) ->
      leaderboardData = _.where(leaderboardData, { 'id': $scope.profile.id })[0]
      
      $scope.numberTries = leaderboardData.tries
      $scope.numberWins = leaderboardData.wins
      $scope.numberLosses = leaderboardData.losses
      if (leaderboardData.wins * 1) > 0 or (leaderboardData.losses * 1) > 0
        $scope.winPercent = (leaderboardData.wins * 100) / (leaderboardData.wins * 1 + leaderboardData.losses * 1)
      else
        $scope.winPercent = 0

  $scope.viewEditProfile = () ->
    $location.url '/my-profile/edit'
]
