object false

child @objects do
  attributes :id, :bet_type, :wager, :odds, :result, :gain, :status, :created_at, :updated_at

  node :links do |bet|
    {
      user: bet.user.id,
      match: bet.match.id
    }
  end

  node :href do |bet|
    bet_url(bet)
  end
end

node :links do
  {
    "bets.user" => users_url + "/{bets.user}",
    "bets.match" => matches_url + "/{bets.match}"
  }
end

node :meta do
  { "client-ids" => true }
end