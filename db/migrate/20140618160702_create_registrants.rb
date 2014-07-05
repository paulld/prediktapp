class CreateRegistrants < ActiveRecord::Migration
  def change
    create_table :registrants, id: :uuid do |t|
      t.string :email
      t.string :registration_code
      t.datetime :registration_expires_at

      t.timestamps
    end
  end
end
