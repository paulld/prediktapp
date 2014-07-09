# TODO: add image to profile
# TODO: change email process (keep user_id)

class SettingsController < ApplicationController

  before_action :is_authenticated?

  def index
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_profile(params[:user][:first_name], params[:user][:last_name], params[:user][:user_name])
      redirect_to settings_url, flash: { success: 'Your details have been updated.' }
    else
      flash.now[:error] = 'Please input valid data.'
      render :edit
    end
  end

  def edit_password
    @user = current_user
  end

  def update_password
    @user = current_user
    @user.update_password(params[:user][:password], params[:user][:password_confirmation])
    if @user.save
        redirect_to settings_url, flash: { success: 'Your password has been updated' }
      else
        @user = current_user
        flash.now[:error] = 'Please input a valid password.'
        render :edit_password
      end
  end


  protected

  def user_params
    params.require(:user).permit( :first_name, :last_name, :user_name, :password, :password_confirmation )
  end
end
