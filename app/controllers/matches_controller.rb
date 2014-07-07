class MatchesController < RestController

  protected

  def configure_controller
    config[:display] = [ :starts_at, :ends_at, :venue, :sport, :league_day, :accepts_bets,
                         :home_odds, :draw_odds, :away_odds, :over_under_value, :over_odds, :under_odds,
                         :home_handicap_value, :away_handicap_value, :home_handicap_odds, :away_handicap_odds,
                         :home_score, :away_score ]            # Fields to (optionally) include in the JSON
    
    config[:require] = [ :id, :league_id, :home_team, :away_team ]            # Fields that MUST be included in the JSON
    
    config[:permit]  = [ :league_id, :home_team, :away_team,
                         :starts_at, :ends_at, :venue, :sport, :league_day, :accepts_bets,
                         :home_odds, :draw_odds, :away_odds, :over_under_value, :over_odds, :under_odds,
                         :home_handicap_value, :away_handicap_value, :home_handicap_odds, :away_handicap_odds,
                         :home_score, :away_score ]            # Permitted params for create/replace/update
    
    config[:include] = [ :league, :bets, :match_comments ]                         # Associated objects to be eagerly loaded
  end
  
end


#  add more data for bets ?


