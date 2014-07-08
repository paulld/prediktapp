class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.



  # protect_from_forgery with: :exception
  # TODO: uncomment protect_from_forgery when in production

  helper_method :current_user, :get_login_tab
  
  def current_user
    @current_user ||= User.find_by id: session[:user_id]         # INFO:   A ||= B  same as A = A || B
  end

  def is_authenticated?
    redirect_to login_url unless current_user
  end

  def get_login_tab
    session[:tab]
  end

  def set_login_tab(tab)
    session[:tab] = tab
  end

  
  protected

  def log_user_in(user)
    session[:user_id] = user.id
  end

  def log_user_out
    session[:user_id] = nil
  end
end
