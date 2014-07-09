class Match < ActiveRecord::Base
  default_scope -> { order('starts_at ASC') }
  belongs_to :league
  has_many :match_comments, dependent: :destroy
  has_many :bets, dependent: :destroy
end
