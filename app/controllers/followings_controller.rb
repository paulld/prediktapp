class FollowingsController < RestController

  protected

  def configure_controller
    config[:display] = []                                       # Fields to (optionally) include in the JSON
    config[:require] = [ :id, :follower_id, :followed_id ]      # Fields that MUST be included in the JSON
    config[:permit]  = []                                       # Permitted params for create/replace/update
    config[:include] = [ :follower, :followed ]                 # Associated objects to be eagerly loaded
  end

# TODO: Need to add get_includes for follower & followed??

end

# ADD follower and followed names ?