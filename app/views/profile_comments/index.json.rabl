object false

# This creates an "profile_comments": [] key-value pair with one or more bet hashes
# Adding the => :profile_comments ensures that an empty array still displays
child @profile_comments => :profile_comments do
  attributes :id, :content, :created_at, :updated_at

  node :links do |profile_comment|
    {
      profile_commentee: profile_comment.profile_commentee.id,
      # profile_commentee: profile_comment.profile_commentee.user_name,
      profile_commentor: profile_comment.profile_commentor.id
      # profile_commentor: profile_comment.profile_commentor.user_name
    }
  end

  node :href do |profile_comment|
    profile_comment_url(profile_comment)
  end
end

# :links provides a hash of URL templates to satisfy the hypermedia constraint
node :links do
  {
    "profile_comment.profile_commentee" => users_url + "/{profile_comment.profile_commentee}",
    "profile_comment.profile_commentor" => users_url + "/{profile_comment.profile_commentor}"
  }
end

node :meta do
  { "client-ids" => true }
end