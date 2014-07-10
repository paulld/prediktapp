predikt.controller 'UpcomingMatchesCtrl', ($scope, $http, User) ->
  $http.get('./api/matches?game_started=false&sort=starts_at&recent=10').success (data) ->
    $scope.matches = data.matches
    $scope.profile = null
      # console.log User

    User.getUser().then (result) ->
      $scope.profile = result.data.users[0]


    # $scope.bet = (id, betType) ->
    #   User.getUser().then (result) ->
    #     $scope.profile = result.data.users[0]
    #     console.log id
    #     console.log betType
    #     console.log result
    #     console.log $scope.profile
  

    $scope.placeBet = (userId, matchId, betType, odds, wager) ->
      # PUT to create a new bet
      $http.get('./api/uuids').success (uuid) ->
        $scope.newUuid = uuid.uuids[0]

        putData = {
          "links.user.id": userId
          "links.match.id": matchId
          "bet_type": betType
          "odds": odds
          "wager": wager
        }
        putUrl = "./api/bets/#{$scope.newUuid}"

        console.log putData
        console.log putUrl
        $http.put(putUrl, putData)
  


    $scope.bet = (matchId, betType, odds, wager) ->
      # User.clickButton().then (placeBet) ->
    #     console.log placeBet
      #   $scope.bet = placeBet.bet_type[0] 
      if $scope.profile    
        alert "Placing the bet on #{betType} for #{matchId} (odds: #{odds})!"
      else
        alert "Please log in to place a bet!"
      # console.log 'need to place bet', betType, 'for user ', $scope.profile
      console.log 'need to place', wager, ' on ', betType, '(odds: ', odds, ') for user ', $scope.profile.id, 'on match id: ', matchId

      $scope.placeBet($scope.profile.id, matchId, betType, odds, wager)
