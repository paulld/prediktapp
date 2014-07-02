object false

# This creates an "leagues": [] key-value pair with one or more bet hashes
# Adding the => :leagues ensures that an empty array still displays
child @leagues => :leagues do
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

# :links provides a hash of URL templates to satisfy the hypermedia constraint
node :links do
  {
    "leagues.matches" => matches_url + "/{leagues.matches}"
  }
end

node :meta do
  { "client-ids" => true }
end