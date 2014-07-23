predikt.controller 'publicProfileCtrl', ($scope, $http, $routeParams, User, Message) ->
  
  userId = $routeParams.userId
  
  User.getUser(userId).then (result) ->
    $scope.user = result.data.users[0]

    User.getUserBets($scope.user.id).success (betData) ->
      $scope.bets = betData.bets

      for bet in $scope.bets
        bet.status = bet.links.match.match_status
        if bet.status is 'pending' then $scope.hasPendingBets = true
        if bet.status is 'ongoing' then $scope.hasOngoingBets = true
        if bet.status is 'completed' then $scope.hasCompletedBets = true
          
    User.getUserCoinTransactions(userId).success (transactionData) ->
      $scope.coinTransactions = transactionData.coin_transactions
      if $scope.coinTransactions.length > 0 then $scope.hasCoinTransactions = true

      for transaction in $scope.coinTransactions
        switch transaction.transaction_type
          when 'init'
            transaction.matchUrl = ''
            transaction.urlClass = 'hide'
            transaction.transaction_type = 'Awarded at sign up'
          when 'place_bet'
            transaction.matchUrl = '/#/completed/' + transaction.match_reference
            transaction.urlClass = 'btn-danger'
            transaction.transaction_type = 'Placed a bet'
          when 'win_bet'
            transaction.matchUrl = '/#/completed/' + transaction.match_reference
            transaction.urlClass = 'btn-success'
            transaction.transaction_type = 'Won a bet'

    $scope.profile = null
    User.getCurrentUser().then (result) ->
      $scope.profile = result.data.users[0]

    $scope.follow = (userId) ->
      if $scope.profile
        User.createFollow($scope.profile.id, userId, $scope.user.user_name)
      else
        Message.noty('Please log in to follow.', 'error', 700)
