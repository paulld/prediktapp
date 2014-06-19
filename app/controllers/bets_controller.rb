class BetsController < RestController

  protected

  def get_includes
    [ :match, :user ]
  end

  # def object_params
  #   params.require(:bet).permit( :bet_type,
  #                                :wager,
  #                                :odds,
  #                                :result,
  #                                :gain,
  #                                :status,
  #                                { matches: [ :home_team, 
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