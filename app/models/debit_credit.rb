class DebitCredit

  def debit_wager(params)
    head :not_found unless user = User.find_by( id: params[:user_id] )
    
    oldCoins = user.coins
    wager = params[:wager]
    newCoins = oldCoins - wager
    
    sql = %{
      UPDATE "users" SET "coins" = #{newCoins} WHERE "users"."id" = '#{params[:user_id]}'
    }.squish
    
    ActiveRecord::Base.connection.execute(sql).to_a
  end

  def set_coin_transaction(params)


  end

end