object false

child @objects do
  attributes :id, :content, :created_at, :updated_at

  node :links do |profile_comment|
    {
      commentee: profile_comment.commentee,
      commentor: profile_comment.commentor
    }
  end

  node :href do |profile_comment|
    profile_comment_url(profile_comment)
  end
end

node :links do
  {
    "profile_comment.commentor" => users_url + "/{profile_comment.commentor}",
    "profile_comment.commentee" => users_url + "/{profile_comment.commentee}"
  }
end

node :meta do
  { "client-ids" => true }
end