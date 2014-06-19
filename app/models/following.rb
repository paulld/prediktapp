class Following < ActiveRecord::Base
  default_scope -> { order('created_at ASC') }
  
  belongs_to :profile_commentor, class_name: "User"
  belongs_to :profile_commentee, class_name: "User"
end
