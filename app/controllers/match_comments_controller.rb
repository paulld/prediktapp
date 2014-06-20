class MatchCommentsController < RestController

  protected

  def configure_controller
    config[:display] = [ :content ]             # Fields to (optionally) include in the JSON
    config[:require] = [ :id, :user_id, :match_id ]                  # Fields that MUST be included in the JSON
    config[:permit]  = [ :content ]             # Permitted params for create/replace/update
    config[:include] = [ :user, :match ]        # Associated objects to be eagerly loaded
  end

end

# ADD user name and match info ?