class CreateCoinTransactions < ActiveRecord::Migration
  def change
    create_table :coin_transactions, id: :uuid do |t|
      t.decimal :before_value
      t.decimal :after_value
      t.string :transaction_type
      t.string :bet_reference
      
      t.uuid :user_id, index: true

      t.timestamps
    end
  end
end
