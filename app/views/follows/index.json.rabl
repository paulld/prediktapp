object false

child @objects do
  attributes :id, :created_at, :updated_at

  node :links do |profile_comment|
    {
      follower: profile_comment.follower,
      followee: profile_comment.followee
    }
  end

  node :href do |follow|
    follow_url(follow)
  end
end

node :links do
  {
    "follows.follower" => users_url + "/{follows.follower}",
    "follows.followee" => users_url + "/{follows.followee}"
  }
end

node :meta do
  { "client-ids" => true }
end