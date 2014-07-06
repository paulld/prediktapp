class CoinTransactionsController < RestController

  protected

  def configure_controller
    config[:display] = [ :bet_reference ]                  # Fields to (optionally) include in the JSON
    config[:require] = [ :id, :user_id, :amount_change, :transaction_type ]                   # Fields that MUST be included in the JSON
    config[:permit]  = [ :user_id, :amount_change, :transaction_type, :bet_reference ]        # Permitted params for create/replace/update
    config[:include] = [ :user ]                                                              # Associated objects to be eagerly loaded
  end
     
end