predikt.factory 'Match', ($http, Message) ->
  Match = 
      
    getHomeDrawAwayResult: (homeScore, awayScore) ->
      winner = switch
        when homeScore is awayScore then 'draw'
        when homeScore > awayScore then 'home'
        when homeScore < awayScore then 'away'

    getOverUnderResult: (homeScore, awayScore, overUnderValue) ->
      winner = if (homeScore*1 + awayScore*1) > overUnderValue*1
        'over'
      else
        'under'
      winner

    getHandicapResult: (homeScore, awayScore, handicapValue, handicapSide) ->
      scoreDiff = homeScore - awayScore
      if handicapSide is 'home'
        winner = if (scoreDiff > handicapValue) then 'home_handicap' else 'away_handicap'
      else
        winner = if (scoreDiff < - handicapValue) then 'away_handicap' else 'home_handicap'
      winner

    setComplete: (matchId, homeScore, awayScore, overUnderValue, handicapValue, handicapSide) ->
      # startsAt = Date.now()
      # endsAt = new Date()
      homeDrawAwayResult = Match.getHomeDrawAwayResult(homeScore, awayScore)
      overUnderResult = Match.getOverUnderResult(homeScore, awayScore, overUnderValue)
      
      handicapResult = Match.getHandicapResult(homeScore, awayScore, handicapValue, handicapSide)

      updateData = {
        home_score: homeScore
        away_score: awayScore
        home_draw_away_result: homeDrawAwayResult
        over_under_result: overUnderResult
        handicap_result: handicapResult
        match_status: 'completed'
        starts_at: "2014-07-21 20:00:00 +0800"
        ends_at: "2014-07-21 22:00:00 +0800"
      }
      $http(
        method: "PATCH"
        url: './api/matches/' + matchId
        data: updateData
      ).success () ->
        Message.noty('Done, the match is now completed.', 'success', 2000)
      .error () ->
        Message.noty('Something went wrong! Please try again.', 'error', 700)   


    unsetComplete: (matchId) ->
      updateData = {
        home_score: ''
        away_score: ''
        home_draw_away_result: ''
        over_under_result: ''
        handicap_result: ''
        match_status: 'pending'
        starts_at: "2014-08-21 20:00:00 +0800"
        ends_at: "2014-08-21 22:00:00 +0800"
      }
      $http(
        method: "PATCH"
        url: './api/matches/' + matchId
        data: updateData
      ).success () ->
        Message.noty('Done, the match is now pending.', 'success', 2000)
      .error () ->
        Message.noty('Something went wrong! Please try again.', 'error', 700)   

    settle: (matchId) ->
      $http(
        method: "GET"
        url: './api/matches/' + matchId + '/settle'
      ).success () ->
        Message.noty('Done, all bets are settled.', 'success', 2000)
      .error () ->
        Message.noty('Something went wrong! Please try again.', 'error', 700)         


