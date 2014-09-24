predikt.controller 'publicProfileCtrl', ["$scope", "$http", "$routeParams", "User", "Message", ($scope, $http, $routeParams, User, Message) ->
  
  userId = $routeParams.userId
  
  User.getUser(userId).then (result) ->
    $scope.user = result.data.users[0]

    User.getUserBets($scope.user.id).success (betData) ->
      $scope.bets = betData.bets
      $scope.totalPendingBets = $scope.totalOngoingBets = $scope.totalCompletedBets = 0

      for bet in $scope.bets
        switch bet.status = bet.links.match.match_status
          when 'pending'
            $scope.hasPendingBets = true
            $scope.totalPendingBets += 1
          when 'ongoing'
            $scope.hasOngoingBets = true
            $scope.totalOngoingBets += 1
          when 'completed'
            $scope.hasCompletedBets = true
            $scope.totalCompletedBets += 1
        bet.bet_type = switch
          when bet.bet_type is 'home_handicap' then 'home handicap'
          when bet.bet_type is 'away_handicap' then 'away handicap'
          else bet.bet_type
          
    User.getUserCoinTransactions(userId).success (transactionData) ->
      $scope.coinTransactions = transactionData.coin_transactions
      if $scope.coinTransactions.length > 0 then $scope.hasCoinTransactions = true

      for transaction in $scope.coinTransactions
        switch transaction.transaction_type
          when 'init' then transaction.transaction_type = 'Awarded at sign up'
          when 'place_bet' then transaction.transaction_type = 'Placed a bet'
          when 'win_bet' then transaction.transaction_type = 'Won a bet'

    $scope.profile = null
    User.getCurrentUser().then (result) ->
      $scope.profile = result.data.users[0]


    User.getLeaderboardData().success (leaderboardData) ->
      leaderboardData = _.where(leaderboardData, { 'id': userId })[0]
      $scope.numberTries = leaderboardData.tries
      $scope.numberWins = leaderboardData.wins
      $scope.numberLosses = leaderboardData.losses

      if (leaderboardData.wins * 1) > 0 or (leaderboardData.losses * 1) > 0
        $scope.winPercent = (leaderboardData.wins * 100) / (leaderboardData.wins * 1 + leaderboardData.losses * 1)
      else
        $scope.winPercent = 0


    $scope.follow = (userId) ->
      if $scope.profile
        User.createFollow($scope.profile.id, userId, $scope.user.user_name)
      else
        Message.noty('Please log in to follow.', 'error', 700)
]
