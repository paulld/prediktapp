class RegistrationController < ApplicationController

  def new
    # TODO: reset showTab to "" after any action ?????? cf. other Controllers too
    if @registrant = Registrant.find_by_code(params[:registration_code])
      @user = User.new(email: @registrant.email)
    else
      alert 'Your registration is expired. Please sign up.'
      # set_login_tab("signup")
      # redirect_to "/login", flash: { error: 'Your registration is expired. Please sign up.' }
    end
  end

  def create
    if @registrant = Registrant.find_by_code(params[:registration_code])
      @user = User.new( user_params.merge(email: @registrant.email) )

      if @user.save
        @registrant.destroy
        log_user_in(@user)
        alert 'Your registration is complete! You are now logged in.'
        # redirect_to profile_url, flash: { success: 'Your registration is complete! You are now logged in.' }
      else
        alert 'Please input a valid password.'
        # flash.now[:error] = 'Please input a valid password.'
        # render :new
      end
    else
      set_login_tab("signup")
      alert 'Your registration is expired. Please sign up.'
      # redirect_to "/login", flash: { error: 'Your registration is expired. Please sign up.' }
    end
  end

  protected

  def user_params
    # INFO: Strong params = White List = only fields that are allowed to be passed in the form
    params.require(:user).permit( :password, :password_confirmation )
  end
end
