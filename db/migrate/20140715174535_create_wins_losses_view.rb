class CreateWinsLossesView < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE VIEW wins_losses AS
      (SELECT users.id, users.user_name,
      coalesce(u.tries, 0) AS tries, coalesce(s.wins, 0) AS wins, coalesce(t.losses, 0) AS losses
      FROM users 
      left join (select bets.user_id, count(bets.id) AS tries from bets 
        group by bets.user_id) AS u on users.id = u.user_id
      left join (select bets.user_id, count(bets.id) AS wins from bets where bets.is_successful = TRUE
        group by bets.user_id) AS s on users.id = s.user_id 
      left join (select bets.user_id, count(bets.id) AS losses from bets where bets.is_successful = FALSE 
        group by bets.user_id) AS t on users.id = t.user_id)
    SQL
  end

  def down
    execute <<-SQL
      drop view wins_losses
    SQL
  end
end
