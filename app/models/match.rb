class Match < ActiveRecord::Base
  default_scope -> { order('starts_at ASC') }
  belongs_to :league
  has_many :match_comments, dependent: :destroy
  has_many :bets, dependent: :destroy

  validates :match_status, inclusion: { in: MATCH_STATUS }
  
  validates :handicap_side, inclusion: { in: HOME_AWAY }, allow_blank: true
  
  validates :home_draw_away_result, inclusion: { in: HOME_DRAW_AWAY }, allow_blank: true
  validates :over_under_result, inclusion: { in: OVER_UNDER }, allow_blank: true
  validates :handicap_result, inclusion: { in: HOME_AWAY }, allow_blank: true
end