object false

# This creates an "followings": [] key-value pair with one or more bet hashes
# Adding the => :followings ensures that an empty array still displays
child @followings => :followings do
  attributes :id, :created_at, :updated_at

  node :links do |profile_comment|
    {
      follower: profile_comment.follower.id,
      followee: profile_comment.followee.id
    }
  end

  node :href do |following|
    following_url(following)
  end
end

# :links provides a hash of URL templates to satisfy the hypermedia constraint
node :links do
  {
    "followings.follower" => users_url + "/{followings.follower}",
    "followings.followee" => users_url + "/{followings.followee}"
  }
end

node :meta do
  { "client-ids" => true }
end