class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets, id: :uuid do |t|
      
      t.string  :bet_type
      t.decimal :wager
      t.decimal :odds

      t.boolean :is_successful
      t.decimal :gain
      t.boolean :is_settled
      
      t.uuid :user_id, index: true
      t.uuid :match_id, index: true

      t.timestamps
    end
  end
end


