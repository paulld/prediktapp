class Follow < ActiveRecord::Base
  default_scope -> { order('created_at ASC') }
  belongs_to :user, class_name: "follower"
  belongs_to :user, class_name: "followee"
end
