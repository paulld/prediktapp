class Bet < ActiveRecord::Base
  default_scope -> { order('created_at ASC') }
  belongs_to :user
  belongs_to :match

  validates :bet_type, inclusion: { in: BET_TYPE }
end
