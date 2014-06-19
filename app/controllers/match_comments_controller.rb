class MatchCommentsController < RestController

  protected

  def get_includes
    [ :match, :user ]
  end

  # def object_params
  #   params.require(:match_comment).permit( :user, :match, :content )
  # end
end

# ADD user name and match info ?