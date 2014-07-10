predikt.factory 'Bet', ($http) ->
  Bet = 

    create: (putData) ->
      $http.get('./api/uuids').success (uuid) ->
        newUuid = uuid.uuids[0]
        
        putUrl = "./api/bets/#{newUuid}"

        console.log 'data', putData
        console.log 'url', putUrl
        $http
          method: "PUT"
          url: putUrl
          data: putData

  Bet
