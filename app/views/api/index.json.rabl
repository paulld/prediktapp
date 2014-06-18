object false

node :links do
  {
    uuid: uuid_url,
    registrants: registrants_url,
    users: users_url,
    leagues: leagues_url,
    matches: matches_url,
    bets: bets_url,
    match_comments: match_comments_url,
    profile_comments: profile_comments_url,
    follows: follows_url
  }
end

node :meta do
  { "client-ids" => true }
end