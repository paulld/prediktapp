class CreateMatchComments < ActiveRecord::Migration
  def change
    create_table :match_comments, id: :uuid do |t|
      t.string :content

      t.uuid :user_id, index: true
      t.uuid :match_id, index: true

      t.timestamps
    end
  end
end
