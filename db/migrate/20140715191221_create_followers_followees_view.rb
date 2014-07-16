class CreateFollowersFolloweesView < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE VIEW followers_followees AS
      (
        SELECT users.id, users.user_name,
      coalesce(u.followers, 0) AS followers, coalesce(s.followees, 0) AS followees
      FROM users 
      left join (select followings.follower_id, count(followings.id) AS followers from followings 
        group by followings.follower_id) AS u on users.id = u.follower_id
      left join (select followings.followee_id, count(followings.id) AS followees from followings
        group by followings.followee_id) AS s on users.id = s.followee_id
      )
    SQL
  end

  def down
    execute <<-SQL
      drop view wins_losses
    SQL
  end
end
