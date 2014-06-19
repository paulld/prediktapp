object false

child @objects do
  attributes :id, :home_team, :away_team, :starts_at, :ends_at, :venue, :sport, :league_day, :accepts_bets, :home_odds, :draw_odds, :away_odds, :over_under_odds, :home_handicap_odds, :away_handicap_odds, :home_score, :away_score, :created_at, :updated_at

  node :links do |match|
    {
      league: match.league,
      bets: match.bets.map {|i| i.id },
      match_comments: match.match_comments.map {|j| j.id }
    }
  end

  node :href do |match|
    match_url(match)
  end
end

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