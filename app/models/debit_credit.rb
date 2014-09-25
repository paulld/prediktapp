class DebitCredit

  def initialize(user)
    @user = user
  end

  def debit_wager(wager)
    @user.coins -= wager
    if wager > 0 and wager < 51 and @user.coins > 0
      @user.save
    else
      false
    end
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


  def settle_bets(matchId, homeDrawAwayResult, overUnderResult, handicapResult)

    betsToSettle = Bet.where(match_id: matchId)

    betsToSettle.each do |b|
      if b.bet_type == homeDrawAwayResult || b.bet_type == overUnderResult || b.bet_type == handicapResult
        b.is_successful = true
        b.gain = b.wager * b.odds
        b.save

        # credit coins to user if successful
        credit_coins(b.user_id, b.gain, b.id, matchId)

      else
        b.is_successful = false
        b.gain = 0
        b.save
      end
    end
  end

  def credit_coins(userId, gain, betId, matchId)
    user = User.find(userId)
    user.coins += gain
    user.save

    # create coin transaction
    record_credit_transaction(userId, gain, user.coins, betId, matchId)
  end

  def record_credit_transaction(userId, gain, newCoins, betId, matchId)
    CoinTransaction.create(
      id: get_uuid,
      user_id: userId,
      transaction_type: 'win_bet',
      bet_reference: betId,
      match_reference: matchId,
      before_value: newCoins - gain,
      after_value: newCoins
    )
  end


  def unsettle_bets(matchId)
    betsToUnsettle = Bet.where(match_id: matchId)
    betsToUnsettle.each do |b|     
      # uncredit coins to user was successful
      if b.is_successful = true
        credit_coins(b.user_id, -b.gain, b.id, matchId)
      end
      
      b.is_successful = ''
      b.gain = ''
      b.save
    end
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