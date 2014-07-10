predikt.controller 'UpcomingMatchesCtrl', ($scope, $http, User, Bet, Message) ->
  $http.get(
    './api/matches?game_started=false&sort=starts_at&recent=10'
  ).success (data) ->
    
    $scope.matches = data.matches
    
    $scope.profile = null
    User.getUser().then (result) ->
      $scope.profile = result.data.users[0]

    $scope.clickToBet = (matchId, betType, odds, wager) ->
      if $scope.profile
        console.log 'need to place', wager, ' on ', betType, '(odds: ', odds, ') for user ', $scope.profile.id, 'on match id: ', matchId

        putData = {
          "links.user.id": $scope.profile.id
          "links.match.id": matchId
          "bet_type": betType
          "odds": odds
          "wager": wager
        }

        Bet.create(putData)
      else
        Message.noty('Please log in to place a bet.', 'error', 700)
