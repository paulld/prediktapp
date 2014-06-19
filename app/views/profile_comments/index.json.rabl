object false

child @objects do
  attributes :id, :content, :created_at, :updated_at

  node :links do |profile_comment|
    {
      profile_commentee: profile_comment.profile_commentee,
      profile_commentor: profile_comment.profile_commentor
    }
  end

  node :href do |profile_comment|
    profile_comment_url(profile_comment)
  end
end

node :links do
  {
    "profile_comment.profile_commentor" => users_url + "/{profile_comment.profile_commentor}",
    "profile_comment.profile_commentee" => users_url + "/{profile_comment.profile_commentee}"
  }
end

node :meta do
  { "client-ids" => true }
end