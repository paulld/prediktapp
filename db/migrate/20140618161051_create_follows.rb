class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows, id: :uuid do |t|
      t.uuid :follower, index: true
      t.uuid :followee, index: true

      t.timestamps
    end

    # create_table :users_users, id: false do
    #   t.uuid :user_id, index: true
    #   t.uuid :user_id, index: true
    # end
  end
end

