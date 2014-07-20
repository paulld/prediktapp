class Bet < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  belongs_to :user
  belongs_to :match

  validates :bet_type, presence: true, inclusion: { in: BET_TYPE }
  validates :wager, presence: true
  validates :odds, presence: true
end


# {"bet": {"user_id": "71c65b41-d868-40eb-9e6b-876dfbb76b91", "match_id": "925a12af-8a84-4773-979e-6b17e1199fa0", "bet_type": "draw", "wager": 10 }}