class User < ActiveRecord::Base
  default_scope -> { order('created_at ASC') }
  has_many :bets
  has_many :match_comments
  
  has_many :profile_commentors, through: :profile_comments_as_commentors, class_name: "User"
  has_many :profile_commentees, through: :profile_comments_as_commentees, class_name: "User"
  has_many :profile_comments_as_commentors, class_name: "ProfileComment", foreign_key: "profile_commentor_id", dependent: :destroy
  has_many :profile_comments_as_commentees, class_name: "ProfileComment", foreign_key: "profile_commentee_id", dependent: :destroy

  has_many :followers, through: :followings_as_followers, class_name: "User"
  has_many :followees, through: :followings_as_followees, class_name: "User"
  has_many :followings_as_followers, class_name: "Following", foreign_key: "follower_id", dependent: :destroy
  has_many :followings_as_followees, class_name: "Following", foreign_key: "followee_id", dependent: :destroy
  
end