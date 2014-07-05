class LeaguesController < RestController

  protected

  def configure_controller
    config[:display] = [ :name ]                    # Fields to (optionally) include in the JSON
    config[:require] = [ :id, :sport_id ]            # Fields that MUST be included in the JSON
    config[:permit]  = [ :name, :sport_id ]                    # Permitted params for create/replace/update
    config[:include] = [ :sport, :matches ]            # Associated objects to be eagerly loaded
  end

end
