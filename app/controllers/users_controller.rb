class UsersController < ApplicationController
  resource_controller

  def index
    @users = User.alphabetical_group(params[:letter])
  end
  
  new_action.wants.html { render :edit }
  
  create.failure.wants.html { render :edit }
  create.wants.html { redirect_to users_path }

  update.before do
    if params[:user] && params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end
  update.wants.html { redirect_to users_path }

end
