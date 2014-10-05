class ProfileController < ApplicationController
  # before_action :is_authenticated?

  def show
    render :empty unless current_user
  end

  def empty

  end
  
end  