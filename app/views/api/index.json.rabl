# We set the object to false so that we can control the top level hash
object false

# `node` adds a key-value pair to our hash
# The value is passed in a block and can be anything we want,
# including another hash
# Because we're in a view, view helpers such as the route helpers are available
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
    followings: followings_url
  }
end

# The "client-ids" meta element indicates that we expect the client to
# provide the ids, ensuring idempotency
node :meta do
  { "client-ids" => true }
end
