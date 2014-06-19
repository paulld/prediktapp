class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings, id: :uuid do |t|
      t.uuid :follower, index: true
      t.uuid :followed, index: true

      t.timestamps
    end

    # create_table :users_users, id: false do
    #   t.uuid :user_id, index: true
    #   t.uuid :user_id, index: true
    # end
  end
end

