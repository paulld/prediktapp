class BetsController < RestController

  protected

  def configure_controller
    config[:display] = [ :bet_type, :wager, :odds, :result, :gain, :status ]        # Fields to (optionally) include in the JSON
    config[:require] = [ :id, :user_id, :match_id ]                                 # Fields that MUST be included in the JSON
    config[:permit]  = [ :user_id, :match_id, :bet_type, :wager, :odds, :result, :gain, :status ]        # Permitted params for create/replace/update
    config[:include] = [ :user, :match ]                                            # Associated objects to be eagerly loaded
  end
     

end