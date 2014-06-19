class CreateProfileComments < ActiveRecord::Migration
  def change
    create_table :profile_comments, id: :uuid do |t|
      t.string :content
      t.uuid :profile_commentor #, index: true
      t.uuid :profile_commentee #, index: true

      t.timestamps
    end

    # create_table :users_users, id: false do
    #   t.uuid :user_id, index: true
    #   t.uuid :user_id, index: true
    # end
  end
end
