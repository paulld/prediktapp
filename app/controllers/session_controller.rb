class SessionController < ApplicationController

  def new
    @user = User.new
  end

  def create
    case params[:user][:login_form_type]

    when "login"
      if @user = User.authenticate(params[:user][:email], params[:user][:password])
        log_user_in(@user)
        redirect_to '/#/upcoming', flash: { success: 'You were successfully logged in.' }
      else
        @user = User.new( user_params )
        # render text: 'Email and Password don\'t match. Please try again or try to reset your password.'
        flash.now[:error] = 'Email and Password don\'t match. Please try again or try to reset your password.'
        set_login_tab("")
        render :new
      end

    when "signup"
      @registrant = Registrant.new( user_params )

      if @registrant.save
        EmailValidator.complete_registration(@registrant).deliver
        @user = User.new( user_params )
        # render text: 'We sent you an email to confirm your registration. Please check your emails.'
        flash.now[:success] = 'We sent you an email to confirm your registration. Please check your emails.'
        set_login_tab("signup")
        render :new
      else
        @user = User.new( user_params )
        # render text: 'Invalid email address. Please try again.'
        flash.now[:error] = 'Invalid email address. Please try again.'
        set_login_tab("signup")
        render :new
      end

    else
      if @user = User.find_by( :email => params[:user][:email] )        # TODO: diff params[:user][:email] and user_params[:email] ??
        @user.generate_password_reset_code
        EmailValidator.password_reset(@user).deliver
        @user = User.new( user_params )
        # render text: 'We sent you an email to reset your password.'
        flash.now[:success] = 'We sent you an email to reset your password.'
        render :new
      else
        # render text: 'Invalid email address. Please try again.'
        flash[:error] = "Invalid email address. Please try again."
        @user = User.new( user_params )
        set_login_tab("reset")
        render :new
      end
    end

  end

  def destroy
    log_user_out
    set_login_tab("")
    redirect_to login_url, flash: { alert: 'You have successfully logged out.' }
  end

  protected

  def user_params
    params.require(:user).permit( :email )
  end
end