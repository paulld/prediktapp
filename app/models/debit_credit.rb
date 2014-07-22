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

  def settle_bets(matchId, homeDrawAwayResult, overUnderResult, handicapResult)

    betsToSettle = Bet.where(match_id: matchId)

    betsToSettle.each do |b|
      if b.bet_type == homeDrawAwayResult || b.bet_type == overUnderResult || b.bet_type == handicapResult
        b.is_successful = true
        b.gain = b.wager * b.odds
        b.save
        puts 'SUCCESSFULLY SAVED!!!!!!!!'
      else
        b.is_successful = false
        b.gain = 0
        b.save
        puts 'NOOOOOOOO BUT SAVED'
      end
      # do the stuff
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