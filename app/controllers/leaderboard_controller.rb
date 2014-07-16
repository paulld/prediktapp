class LeaderboardController < ApplicationController

  def index
    # sql = "select u.id, u.user_name as name, wl.wins, wl.losses from users as u left join wins_losses as wl on u.id = wl.id;"
    # sql = "SELECT \"users\".* FROM \"users\" ORDER BY created_at ASC"

    # sql = %{
    #           SELECT u.id, u.email, u.user_name, u.coins, u.win_percentage, u.current_streak,
    #           wl.tries, wl.wins, wl.losses 
    #           FROM users AS u LEFT JOIN wins_losses AS wl
    #           ON u.id = wl.id;
    #         }.squish

    sql = %{
              SELECT u.id, u.email, u.user_name, u.coins, u.win_percentage, u.current_streak,
              wl.tries, wl.wins, wl.losses,
              ff.followers, ff.followees 
              FROM users AS u LEFT JOIN wins_losses AS wl
              ON u.id = wl.id LEFT JOIN followers_followees AS ff ON u.id = ff.id;
            }.squish

    @bets = ActiveRecord::Base.connection.execute(sql).to_a

    render json: @bets
  end

  def win_loss
    sql = "select * from wins_losses"
    @win_loss = ActiveRecord::Base.connection.execute(sql).to_a
    render json: @win_loss
  end
 
  def follows
    sql = "select * from followers_followees"
    @follows = ActiveRecord::Base.connection.execute(sql).to_a
    render json: @follows
  end

end
