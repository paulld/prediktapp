class User < ActiveRecord::Base
  default_scope -> { order('created_at ASC') }
  has_many :bets
  has_many :match_comments
  # has_many :profile_comments, class_name: "commentor",
  #                             foreign_key: "commentee",
  #                             dependent: :destroy
  # has_many :profile_comments, class_name: "commentee",
  #                             foreign_key: "commentor",
  #                             dependent: :destroy                            
  # has_many :follows, class_name: "follower",
  #                             foreign_key: "followee",
  #                             dependent: :destroy
  # has_many :profile_comments, class_name: "followee",
  #                             foreign_key: "follower",
  #                             dependent: :destroy 
end
