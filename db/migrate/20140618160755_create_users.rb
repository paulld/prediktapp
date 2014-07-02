class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, index: true
      t.string :user_name, index: true
      t.string :first_name
      t.string :last_name
      t.string :salt
      t.string :fish
      t.string :description
      t.string :home_country
      t.string :home_town
      t.string :website
      t.string :reset_code
      t.time :reset_expires_at
      t.decimal :coins
      t.decimal :win_percentage
      t.integer :current_streak

      t.timestamps
    end
  end
end
