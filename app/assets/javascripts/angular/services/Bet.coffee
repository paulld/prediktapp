predikt.factory 'Bet', ($http, Message) ->
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
          links: {
            user: {
              id: profileId
            }
            match: {
              id: matchId
            }
          }
        }

        console.log 'data', putData
        console.log 'url', putUrl
        $http(
          method: "PUT"
          url: putUrl
          data: putData
        )
        Message.noty('A bet was placed.', 'success', 700)
    