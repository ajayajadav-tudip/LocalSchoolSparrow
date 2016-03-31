class DashboardController < ApplicationController
  def dashboard_home
    @users = User.first
  end

  def show
  end

  def dashboard_admin
    @users = User.first
  end


  def edit_password
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(user_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
    else
      render edit_password
    end
  end

end

