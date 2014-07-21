predikt.factory 'Match', ($http, Message) ->
  Match = 

    setComplete: (matchId, homeScore, awayScore) ->
      # startsAt = Date.now()
      # endsAt = new Date()

      updateData = {
        home_score: homeScore
        away_score: awayScore
        match_status: 'completed'
        starts_at: "2014-07-21 20:00:00 +0800"
        ends_at: "2014-07-21 22:00:00 +0800"
      }
      $http(
        method: "PATCH"
        url: './api/matches/' + matchId
        data: updateData
      ).success (message) ->
        Message.noty('Done completed!', 'success', 2000)
      .error (message) ->
        Message.noty('Something went wrong! Please try again.', 'error', 700)   


    unsetComplete: (matchId) ->
      # startsAt = Date.now()
      # endsAt = new Date()

      updateData = {
        home_score: ''
        away_score: ''
        match_status: 'pending'
        starts_at: "2014-08-21 20:00:00 +0800"
        ends_at: "2014-08-21 22:00:00 +0800"
      }
      $http(
        method: "PATCH"
        url: './api/matches/' + matchId
        data: updateData
      ).success (message) ->
        Message.noty('Done unset!', 'success', 2000)
      .error (message) ->
        Message.noty('Something went wrong! Please try again.', 'error', 700)   
