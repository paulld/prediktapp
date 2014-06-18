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

      t.number :home_odds
      t.number :draw_odds
      t.number :away_odds
      t.number :over_under_odds
      t.number :home_handicap_odds
      t.number :away_handicap_odds

      t.number :home_score
      t.number :away_score

      t.timestamps
    end
  end
end
