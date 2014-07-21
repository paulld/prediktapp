class RegistrationController < ApplicationController

  def new
    if @registrant = Registrant.find_by_code(params[:registration_code])
      @user = User.new(email: @registrant.email)
    else
      set_login_tab("signup")
      redirect_to "/login", flash: { error: 'Your registration is expired. Please sign up.' }
    end
  end

  def create
    if @registrant = Registrant.find_by_code(params[:registration_code])
      @user = User.new( user_params.merge(
        email: @registrant.email,
        coins: INIT_NUMBER_OF_COINS,
        user_name: @registrant.email.split("@")[0]
        )
      )

      if @user.save
        @registrant.destroy
        log_user_in(@user)
        DebitCredit.new(current_user).record_init_transaction
        redirect_to "/#/my-profile", flash: { success: 'Your registration is complete! You are now logged in. Please complete your profile.' }
      else
        flash.now[:error] = 'Please input a valid password.'
        render :new
      end
    else
      set_login_tab("signup")
      redirect_to "/login", flash: { error: 'Your registration is expired. Please sign up.' }
    end
  end

  protected

  def user_params
    # INFO: Strong params = White List = only fields that are allowed to be passed in the form
    params.require(:user).permit( :password, :password_confirmation )
  end
end
