class League < ActiveRecord::Base
  default_scope -> { order('created_at ASC') }
  belongs_to :sport
  has_many :matches
end
