class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches, id: :uuid do |t|

      t.string   :home_team
      t.string   :away_team
      t.string   :home_team_iso_code
      t.string   :away_team_iso_code
      
      t.datetime :starts_at
      t.datetime :ends_at
      t.string   :venue
      t.string   :sport
      t.string   :league_day
      t.boolean  :accepts_bets

      t.decimal  :home_odds
      t.decimal  :draw_odds
      t.decimal  :away_odds
      
      t.decimal  :over_under_value
      t.decimal  :over_odds
      t.decimal  :under_odds

      t.decimal  :handicap_value
      t.string  :handicap_side
      t.decimal  :home_handicap_odds
      t.decimal  :away_handicap_odds

      t.string   :match_status
      t.integer  :home_score
      t.integer  :away_score
      t.string   :home_draw_away_result
      t.string   :over_under_result
      t.string   :handicap_result

      t.uuid     :league_id

      t.timestamps
    end
  end
end
