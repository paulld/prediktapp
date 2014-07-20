predikt.factory 'Bet', ($http) ->
  Bet = 

    create: (profileId, matchId, betType, odds, wager) ->
      $http.get('./api/uuids').success (uuid) ->
        newUuid = uuid.uuids[0]
        
        putUrl = "./api/bets/#{newUuid}"

        putData = {
          bet_type: betType
          odds: odds
          wager: wager
          user_id: profileId
          match_id: matchId
        }

        $http(
          method: "PUT"
          url: putUrl
          data: putData
        )
