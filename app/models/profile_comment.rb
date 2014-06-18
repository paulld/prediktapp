class ProfileComment < ActiveRecord::Base
  default_scope -> { order('created_at ASC') }
  belongs_to :user, class_name: "commentor"
  belongs_to :user, class_name: "commentee"
end
