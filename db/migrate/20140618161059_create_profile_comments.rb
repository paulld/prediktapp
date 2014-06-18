class CreateProfileComments < ActiveRecord::Migration
  def change
    create_table :profile_comments, id: :uuid do |t|
      t.string :content
      t.uuid :commentor #, index: true
      t.uuid :commentee #, index: true

      t.timestamps
    end

    # create_table :users_users, id: false do
    #   t.uuid :user_id, index: true
    #   t.uuid :user_id, index: true
    # end
  end
end
