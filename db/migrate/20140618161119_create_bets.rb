class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets, id: :uuid do |t|
      t.string :bet_type
      t.number :wager
      t.number :odds
      t.boolean :result
      t.number :gain
      t.string :status
      
      t.uuid :user_id, index: true
      t.uuid :match_id, index: true

      t.timestamps
    end
  end
end
