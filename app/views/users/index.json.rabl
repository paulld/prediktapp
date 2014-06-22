object false

child @users => :users do
  attributes :id, :email, :user_name, :first_name, :last_name, :salt, :fish, :description, :home_country, :home_town, :website, :reset_code, :reset_expires_at, :coins, :win_percentage, :current_streak, :created_at, :updated_at

  node :links do |user|
    {
      bets: user.bets.map {|i| i.id },
      match_comments: user.match_comments.map {|i| i.id },
      followings_as_followers: user.followings_as_followers.map {|i| i.id },
      followings_as_followees: user.followings_as_followees.map {|i| i.id },
      # followers: user.followers.map {|i| i.id },
      # followees: user.followees.map {|i| i.id },
      profile_comments_as_commentors: user.profile_comments_as_commentors.map {|i| i.id },
      profile_comments_as_commentees: user.profile_comments_as_commentees.map {|i| i.id }
      # profile_commentors: user.profile_commentors.map {|i| i.id },
      # profile_commentees: user.profile_commentees.map {|i| i.id }
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