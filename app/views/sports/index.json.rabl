object false

# This creates an "sports": [] key-value pair with one or more bet hashes
# Adding the => :sports ensures that an empty array still displays
child @sports => :sports do
  attributes :id, :name, :created_at, :updated_at

  node :links do |sport|
    {
      leagues: sport.leagues.map {|i| i.id }
    }
  end

  node :href do |sport|
    sport_url(sport)
  end
end

# :links provides a hash of URL templates to satisfy the hypermedia constraint
node :links do
  {
    "sports.leagues" => leagues_url + "/{sports.leagues}"
  }
end

node :meta do
  { "client-ids" => true }
end