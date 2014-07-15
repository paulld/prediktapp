class LeaderboardController < ApplicationController

  def index
    # sql = "select u.id, u.user_name as name, wl.wins, wl.losses from users as u left join wins_losses as wl on u.id = wl.id;"

    sql = %{SELECT u.id, u.email, u.user_name, u.coins, u.win_percentage, u.current_streak,
                  wl.tries, wl.wins, wl.losses 
                  FROM users AS u LEFT JOIN wins_losses AS wl
                  ON u.id = wl.id;
                }.squish

    # sql = "SELECT \"users\".* FROM \"users\" ORDER BY created_at ASC"
    @bets = ActiveRecord::Base.connection.execute(sql).to_a

    render json: @bets
  end
 
end
