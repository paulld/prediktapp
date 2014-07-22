class DebitCredit

  def initialize(user)
    @user = user
  end

  def debit_wager(wager)
    @user.coins -= wager
    @user.save
  end

  def record_debit_transaction(wager, betId, matchId)
    CoinTransaction.create(
      id: get_uuid,
      user_id: @user.id,
      transaction_type: 'place_bet',
      bet_reference: betId,
      match_reference: matchId,
      before_value: @user.coins + wager,
      after_value: @user.coins
    )
  end

  def record_init_transaction
    CoinTransaction.create(
      id: get_uuid,
      user_id: @user.id,
      transaction_type: 'init',
      before_value: 0,
      after_value: INIT_NUMBER_OF_COINS
    )
  end


  protected

  def get_uuid
    @uuid = ActiveRecord::Base.connection
      .raw_connection
      .exec("select uuid_generate_v4();")
      .field_values("uuid_generate_v4")
      .first
  end

end