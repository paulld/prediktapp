class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches, id: :uuid do |t|
      t.string :home_team
      t.string :away_team
      t.time :starts_at
      t.time :ends_at
      t.string :venue
      t.string :sport
      t.string :league_day
      t.boolean :accepts_bets

      t.decimal :home_odds
      t.decimal :draw_odds
      t.decimal :away_odds
      t.decimal :over_under_odds
      t.decimal :home_handicap_odds
      t.decimal :away_handicap_odds

      t.integer :home_score
      t.integer :away_score

      t.uuid :league_id

      t.timestamps
    end
  end
end
