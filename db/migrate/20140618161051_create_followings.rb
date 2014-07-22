class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings, id: :uuid do |t|
      t.uuid :follower_id, index: true
      t.uuid :followee_id, index: true

      t.timestamps
    end
  end
end

