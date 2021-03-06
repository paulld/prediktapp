class MatchesController < RestController

  def index

    # The query is lazy loaded
    cursor = get_query(:match)

    # Set an instance variable (e.g., @articles) to the cursor returned
    instance_variable_set( get_name, cursor )

    if @ids and cursor.empty?
      # Return a 404 if expecting individual items and none found
      head :not_found
    else
      # Return a 406 (partial content) if fewer items found than asked for
      # Otherwise, return a 200 OK
      render :index, status: partial_content?(cursor.length)
    end
  end

# Match.find(:all, :limit => params[:recent].to_i, :order=> 'created_at desc')

  def past
    @matches = get_query(:matches).where('ends_at < now()')
    render(:index)
  end

  def current
    @matches = get_query(:matches).where('now() BETWEEN starts_at AND ends_at')
    render(:index)
  end

  def future
    @matches = get_query(:matches).where('starts_at > now()')
    render(:index)
  end


  protected

  def configure_controller
    config[:display] = [ :home_team_iso_code, :away_team_iso_code, :starts_at, :ends_at, :venue, :sport, :league_day, :accepts_bets,
                         :home_odds, :draw_odds, :away_odds, :over_under_value, :over_odds, :under_odds,
                         :handicap_value, :handicap_side, :home_handicap_odds, :away_handicap_odds,
                         :match_status, :home_score, :away_score, :home_draw_away_result, :over_under_result, :handicap_result  ]            # Fields to (optionally) include in the JSON
    
    config[:require] = [ :id, :league_id, :home_team, :away_team ]            # Fields that MUST be included in the JSON
    
    config[:permit]  = [ :league_id, :home_team, :away_team, :home_team_iso_code, :away_team_iso_code, 
                         :starts_at, :ends_at, :venue, :sport, :league_day, :accepts_bets,
                         :home_odds, :draw_odds, :away_odds, :over_under_value, :over_odds, :under_odds,
                         :handicap_value, :handicap_side, :home_handicap_odds, :away_handicap_odds,
                         :match_status, :home_score, :away_score, :home_draw_away_result, :over_under_result, :handicap_result ]            # Permitted params for create/replace/update
    
    config[:include] = [ :league, :bets, :match_comments ]                         # Associated objects to be eagerly loaded
  end

end


#  add more data for bets ?
