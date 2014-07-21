class DebitCredit

  def initialize(user)
    @user = user
  end

  def debit_wager(wager)
    @user.coins -= wager
    @user.save
  end

  def record_debit_transaction(wager, betId)
    CoinTransaction.create(
      id: get_uuid,
      user_id: @user.id,
      transaction_type: 'place_bet',
      bet_reference: betId,
      before_value: @user.coins + wager,
      after_value: @user.coins
    )
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