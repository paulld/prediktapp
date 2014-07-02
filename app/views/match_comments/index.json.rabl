object false

# This creates an "match_comments": [] key-value pair with one or more bet hashes
# Adding the => :match_comments ensures that an empty array still displays
child @match_comments => :match_comments do
  attributes :id, :content, :created_at, :updated_at

  node :links do |match_comment|
    {
      user: match_comment.user.id,     # only show id with user.id ??
      match: match_comment.match.id     # only show id with match.id ??
    }
  end

  node :href do |match_comment|
    match_comment_url(match_comment)
  end
end

# :links provides a hash of URL templates to satisfy the hypermedia constraint
node :links do
  {
    "match_comments.user" => users_url + "/{match_comments.user}",
    "match_comments.match" => matches_url + "/{match_comments.match}"
  }
end

node :meta do
  { "client-ids" => true }
end