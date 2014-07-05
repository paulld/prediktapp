class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports, id: :uuid do |t|
      t.string :name, index: true

      t.timestamps
    end
  end
end
