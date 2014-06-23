class LeaguesController < RestController

  protected

  def configure_controller
    config[:display] = [ :name ]            # Fields to (optionally) include in the JSON
    config[:require] = [ :id ]            # Fields that MUST be included in the JSON
    config[:permit]  = [ :name ]            # Permitted params for create/replace/update
    config[:include] = [ :matches ]            # Associated objects to be eagerly loaded
  end

end
