object false

child @objects do
  attributes :id, :email, :user_name, :first_name, :last_name, :salt, :fish, :description, :home_country, :home_town, :website, :reset_code, :reset_expires_at, :coins, :win_percentage, :current_streak, :created_at, :updated_at

  node :links do |user|
    {
      bets: user.bets.map {|i| i.id },
      match_comments: user.match_comments.map {|j| j.id },
      followers: user.followers.map {|k| k.id },      # TODO: followers & followeds ??
      # profile_comments: user.profile_comments.map {|l| l.id }     # TODO: commentors & commentees?
    }
  end

  node :href do |user|
    user_url(user)
  end
end

node :links do
  {
    "users.bets" => bets_url + "/{users.bets}",
    "users.match_comments" => match_comments_url + "/{users.match_comments}"
    # TODO : links for followings and profile_comments
  }
end

node :meta do
  { "client-ids" => true }
end