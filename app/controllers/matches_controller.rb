class MatchesController < RestController

  protected

  def get_includes
    [ :league, :bets, :match_comments ]
  end

  # def object_params
  #   params.require(:match).permit( :home_team, 
  #                                  :away_team, 
  #                                  :starts_at, 
  #                                  :ends_at, 
  #                                  :venue, 
  #                                  :sport, 
  #                                  :league_day, 
  #                                  :accepts_bets,
  #                                  :home_odds, 
  #                                  :draw_odds, 
  #                                  :away_odds, 
  #                                  :over_under_odds, 
  #                                  :home_handicap_odds, 
  #                                  :away_handicap_odds,
  #                                  :home_score, 
  #                                  :away_score,
  #                                  { leagues: [ :name ] },
  #                                  { bets: [ :bet_type, :wager ] },
  #                                  { match_comments: [ :user, :content ] }
  #                                   )
  # end
end


#  add more data for bets ?