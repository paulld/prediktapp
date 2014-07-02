class FollowingsController < RestController

  protected

  def configure_controller
    config[:display] = []                                       # Fields to (optionally) include in the JSON
    config[:require] = [ :id, :follower_id, :followee_id ]      # Fields that MUST be included in the JSON
    config[:permit]  = [ :follower_id, :followee_id ]           # Permitted params for create/replace/update
    config[:include] = [ :follower, :followee ]                 # Associated objects to be eagerly loaded
  end

# TODO: Need to add get_includes for follower & followee??

end

# ADD follower and followee names ?