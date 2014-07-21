class DebitCredit

  def debit_wager(params)
    get_user( params[:user_id] )
    set_new_coins( -params[:wager] )
    
    sql = %{
      UPDATE "users" SET "coins" = #{@newCoins}, "updated_at" = now() at time zone 'utc'
      WHERE "users"."id" = '#{params[:user_id]}'
    }.squish
    ActiveRecord::Base.connection.execute(sql).to_a
  end


  def record_debit_transaction(params, betId)
    get_user( params[:user_id] )
    set_new_coins( -params[:wager] )
    get_uuid

    sql = %{
      INSERT INTO coin_transactions 
        ("transaction_type", "bet_reference", "before_value", "after_value", "id", "user_id", "created_at", "updated_at") 
      VALUES
        ('place_bet', '#{betId}', #{@oldCoins}, #{@newCoins}, '#{@uuid}', '#{params[:user_id]}', now() at time zone 'utc', now() at time zone 'utc')
    }.squish
    ActiveRecord::Base.connection.execute(sql).to_a
  end


  def credit_init_coins(userId)
    get_user( userId )
    set_new_coins( 1000 )
    # TODO*************
  end

  def record_init_transaction(userId)
    get_user( userId )
    set_new_coins( 1000 )
    get_uuid

    sql = %{
      INSERT INTO coin_transactions 
        ("transaction_type", "before_value", "after_value", "id", "user_id", "created_at", "updated_at") 
      VALUES
        ('init', #{@oldCoins}, #{@newCoins}, '#{@uuid}', '#{userId}', now() at time zone 'utc', now() at time zone 'utc')
    }.squish
    ActiveRecord::Base.connection.execute(sql).to_a
  end


  protected

  def get_user(userId)
    head :not_found unless @user = User.find_by( id: userId )
  end

  def set_new_coins(credit)
    @oldCoins = @user.coins
    @newCoins = @oldCoins + credit
  end

  def get_uuid
    @uuid = ActiveRecord::Base.connection
      .raw_connection
      .exec("select uuid_generate_v4();")
      .field_values("uuid_generate_v4")
      .first
  end

end