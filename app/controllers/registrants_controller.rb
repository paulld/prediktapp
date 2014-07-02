class RegistrantsController < RestController

  protected

  def configure_controller
    config[:display] = [ :email, :registration_code, :registration_expires_at ]            # Fields to (optionally) include in the JSON
    config[:require] = [ :id ]            # Fields that MUST be included in the JSON
    config[:permit]  = [ :email, :registration_code, :registration_expires_at ]            # Permitted params for create/replace/update
    config[:include] = []            # Associated objects to be eagerly loaded
  end

end