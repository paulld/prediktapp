class ProfileCommentsController < RestController

  protected

  def configure_controller
    config[:display] = [ :content ]                                               # Fields to (optionally) include in the JSON
    config[:require] = [ :id, :profile_commentor_id, :profile_commentee_id ]      # Fields that MUST be included in the JSON
    config[:permit]  = [ :content, :profile_commentor_id, :profile_commentee_id ] # Permitted params for create/replace/update
    config[:include] = [ :profile_commentor, :profile_commentee ]                 # Associated objects to be eagerly loaded
  end

end

# ADD profile_commentor and profile_commentee names ?