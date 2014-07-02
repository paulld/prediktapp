class League < ActiveRecord::Base
  default_scope -> { order('created_at ASC') }
  has_many :matches
end
