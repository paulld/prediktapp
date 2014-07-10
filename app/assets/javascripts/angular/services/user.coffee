predikt.factory 'User', ($http) ->
  User = 

    getUser: () ->
      $http.get('./api/profile/' ).success (userData) ->
        # console.log 'YO'
        userData
        # userData.users[0]

    

    clickButton: () ->
      $http(
        method: "GET"
        url: "./api/users/"
        # params: "bets.bet_type[0]" 
        ).success (userData)->
          # console.log userData
      # $http.put('./api/bets/').success (betsData) ->
      #   console.log betsData.bets.bet_type[0]
      #   # betsData.bets.bet_type[0]

  User