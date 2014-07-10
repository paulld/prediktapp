class Match < ActiveRecord::Base
  default_scope -> { order('starts_at ASC') }
  belongs_to :league
  has_many :match_comments, dependent: :destroy
  has_many :bets, dependent: :destroy

  validates :match_status, inclusion: { in: MATCH_STATUS }
  validates :home_draw_away, inclusion: { in: HOME_DRAW_AWAY }, allow_blank: true
end
