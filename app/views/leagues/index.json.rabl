object false

child @objects do
  attributes :id, :name, :created_at, :updated_at

  node :links do |league|
    {
      matches: league.matches.map {|i| i.id }
    }
  end

  node :href do |league|
    league_url(league)
  end
end

node :links do
  {
    "leagues.matches" => matches_url + "/{leagues.matches}"
  }
end

node :meta do
  { "client-ids" => true }
end