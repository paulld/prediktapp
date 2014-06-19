class LeaguesController < RestController

  protected

  def get_includes
    # [ :matches, { matches: [ :bets ] } ]
    [ :matches ]
  end

  # def object_params
  #   params.require(:league).permit( :name, 
  #                                   { matches: [ :home_team, 
  #                                                :away_team, 
  #                                                :starts_at, 
  #                                                :ends_at, 
  #                                                :venue, 
  #                                                :sport, 
  #                                                :league_day, 
  #                                                :accepts_bets,
  #                                                :home_odds, 
  #                                                :draw_odds, 
  #                                                :away_odds, 
  #                                                :over_under_odds, 
  #                                                :home_handicap_odds, 
  #                                                :away_handicap_odds,
  #                                                :home_score, 
  #                                                :away_score
  #                                              ]
  #                                   } 
  #                                 )
  # end
end
