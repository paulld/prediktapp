class CreateCoinTransactions < ActiveRecord::Migration
  def change
    create_table :coin_transactions, id: :uuid do |t|
      t.decimal :amount_change
      # t.decimal :total_coins   # NB: add to model? could allow testing if value of user.coins always = the last coin_transaction.total_coins
      t.string :transaction_type
      t.string :bet_reference
      
      t.uuid :user_id, index: true

      t.timestamps
    end
  end
end
