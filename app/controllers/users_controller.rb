class UsersController < RestController

  protected

  def get_includes
    [ :bets, :match_comments ]
    # [ :bets, :match_comments, :profile_comments, :followings ]
  end

  #  TODO : profile_comments made on user's own profile + meade on other profiles
  #  TODO : followings made on user's own profile + meade on other profiles

  # def object_params
  #   params.require(:user).permit( :email,
  #                                          :user_name,
  #                                          :first_name,
  #                                          :last_name,
  #                                          :salt,
  #                                          :fish,
  #                                          :description,
  #                                          :home_country,
  #                                          :home_town,
  #                                          :website,
  #                                          :reset_code,
  #                                          :reset_expires_at,
  #                                          :coins,
  #                                          :win_percentage,
  #                                          :current_streak,
  #                                          { followings: [ :followed, follower ] },
  #                                          { profile_comments: [ :profile_commentor, :profile_commentee, :content ] },
  #                                          { match_comments: [ :content ] },
  #                                          { bets: [ :bet_type, :wager ] }
  #                                         )
  # end
end

# TODO:  add more data for bets ?