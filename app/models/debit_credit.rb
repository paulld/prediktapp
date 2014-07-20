class DebitCredit

  def debit_wager(params)
    head :not_found unless user = User.find_by( id: params[:user_id] )
    
    oldCoins = user.coins
    wager = params[:wager]
    newCoins = oldCoins - wager
    
    sql = %{
      UPDATE "users" SET "coins" = #{newCoins}, "updated_at" = now() at time zone 'utc'
      WHERE "users"."id" = '#{params[:user_id]}'
    }.squish
    
    ActiveRecord::Base.connection.execute(sql).to_a
  end

  def record_debit_transaction(params, betId)

    head :not_found unless user = User.find_by( id: params[:user_id] )
    
    oldCoins = user.coins
    wager = params[:wager]
    newCoins = oldCoins - wager

    uuid = ActiveRecord::Base.connection
      .raw_connection
      .exec("select uuid_generate_v4();")
      .field_values("uuid_generate_v4")
      .first

    sql = %{
      INSERT INTO coin_transactions 
        ("transaction_type", "bet_reference", "before_value", "after_value", "id", "user_id", "created_at", "updated_at") 
      VALUES
        ('place_bet', '#{betId}', #{oldCoins}, #{newCoins}, '#{uuid}', '#{params[:user_id]}', now() at time zone 'utc', now() at time zone 'utc')
    }.squish
    ActiveRecord::Base.connection.execute(sql).to_a
  end


  def record_init_transaction(params)
    # TODO: RECORD TRANSACTION WHEN INIT 1000 COINS AT SIGN UP
  end

end