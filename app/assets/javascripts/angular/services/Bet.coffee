predikt.factory 'Bet', ["$http", "Message", ($http, Message) ->
  Bet = 

    create: (profileId, matchId, homeTeam, awayTeam, betType, odds, wager) ->
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

        coins = if wager is 1 then 'coin' else 'coins'
        successMessage = 
          'You placed '+ wager + ' ' + coins + ' on a bet: <br>' +
          homeTeam + '-' + awayTeam + ' (' + betType + ')'

        $http(
          method: "PUT"
          url: putUrl
          data: putData
        ).success (message) ->
            Message.noty(successMessage, 'success', 2000)
          .error (message) ->
            Message.noty('Something went wrong! Please try again.', 'error', 700)   
]
