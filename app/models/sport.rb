class Sport < ActiveRecord::Base
  default_scope -> { order('created_at ASC') }
  has_many :leagues
end
