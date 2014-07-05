class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues, id: :uuid do |t|
      t.string :name

      t.uuid :sport_id, index: true

      t.timestamps
    end

  end
end
