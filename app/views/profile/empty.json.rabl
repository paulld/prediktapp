object false

child [  ] => :users do
#   attributes :id, :email, :user_name, :first_name, :last_name, :description, :home_country, :home_town, :website, :reset_code, :reset_expires_at, :coins, :win_percentage, :current_streak, :created_at, :updated_at


#   node :links do |user|
#     {
#       bets: user.bets.map {|i| i.id },
#       coin_transactions: user.coin_transactions.map {|s| s.id },
#       match_comments: user.match_comments.map {|j| j.id },
#       followings_as_followers: user.followings_as_followers.map {|k| k.id },
#       followings_as_followees: user.followings_as_followees.map {|l| l.id },
#       # followers: user.followers.map {|m| m.id },
#       # followees: user.followees.map {|n| n.id },
#       profile_comments_as_commentors: user.profile_comments_as_commentors.map {|o| o.id },
#       profile_comments_as_commentees: user.profile_comments_as_commentees.map {|p| p.id }
#       # profile_commentors: user.profile_commentors.map {|q| q.id },
#       # profile_commentees: user.profile_commentees.map {|r| r.id }
#     }
#   end

#   node :href do |user|
#     user_url(user)
#   end
end

# node :links do
#   {
#     "users.bets" => bets_url + "/{users.bets}",
#     "users.coin_transactions" => coin_transactions_url + "/{users.coin_transactions}",
#     "users.followings_as_followers" => followings_url + "/{users.followings_as_followers}",
#     "users.followings_as_followees" => followings_url + "/{users.followings_as_followees}",
#     "users.profile_comments_as_commentors" => profile_comments_url + "/{users.profile_comments_as_commentors}",
#     "users.profile_comments_as_commentees" => profile_comments_url + "/{users.profile_comments_as_commentees}"
#     # TODO : links for followings and profile_comments
#   }
# end

node :meta do
  { "client-ids" => true }
end
