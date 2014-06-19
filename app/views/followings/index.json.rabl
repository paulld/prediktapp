object false

child @objects do
  attributes :id, :created_at, :updated_at

  node :links do |profile_comment|
    {
      follower: profile_comment.follower,
      followed: profile_comment.followed
    }
  end

  node :href do |following|
    following_url(following)
  end
end

node :links do
  {
    "followings.follower" => users_url + "/{followings.follower}",
    "followings.followed" => users_url + "/{followings.followed}"
  }
end

node :meta do
  { "client-ids" => true }
end