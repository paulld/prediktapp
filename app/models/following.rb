class Following < ActiveRecord::Base
  default_scope -> { order('created_at ASC') }
  
  belongs_to :follower, class_name: "User"
  belongs_to :followee, class_name: "User"
end
