class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues, id: :uuid do |t|
      t.string :name, index: true

      t.uuid :match_id, index: true

      t.timestamps
    end

  end
end
