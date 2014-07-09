object false

# This creates an "matches": [] key-value pair with one or more bet hashes
# Adding the => :matches ensures that an empty array still displays
child @matches => :matches do
  attributes :id, :home_team, :away_team, :home_team_iso_code, :away_team_iso_code, :starts_at, :ends_at, :venue, :sport, :league_day, :accepts_bets,
    :home_odds, :draw_odds, :away_odds, :over_under_value, :over_odds, :under_odds,
    :home_handicap_value, :away_handicap_value, :home_handicap_odds, :away_handicap_odds,
    :home_score, :away_score, :created_at, :updated_at

  node :links do |match|
    {
      league: match.league.id,
      bets: match.bets.map {|i| i.id },
      match_comments: match.match_comments.map {|j| j.id }
    }
  end

  node :href do |match|
    match_url(match)
  end

  node :linked do |match|
    {
      league: match.league.name,
      match_comments: match.match_comments.map {|j| j.content }
    }
  end

end

# :links provides a hash of URL templates to satisfy the hypermedia constraint
node :links do
  {
    "matches.league" => leagues_url + "/{matches.league}",
    "matches.bets" => bets_url + "/{matches.bets}",
    "matches.match_comments" => match_comments_url + "/{matches.match_comments}"
  }
end


node :meta do
  { "client-ids" => true }
end