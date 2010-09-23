class UsersController < ApplicationController
  def index
    @users = User.alphabetical_group(params[:letter])
  end
  
  # new_action.wants.html do 
  def new
    render :edit
  end
  
  # create.failure.wants.html { render :edit }
  # create.wants.html { redirect_to users_path }
  def create
    failed = false
    render :edit if failed
    redirect_to users_path
  end

  # update.before do
  #   if params[:user] && params[:user][:password].blank? && params[:user][:password_confirmation].blank?
  #     params[:user].delete(:password)
  #     params[:user].delete(:password_confirmation)
  #   end
  # end
  # update.wants.html { redirect_to users_path }
  def update
    if params[:user] && params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    redirect_to users_path 
  end
end
