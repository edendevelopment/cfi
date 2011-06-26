class UsersController < ApplicationController
  respond_to :html

  def index
    respond_with @users = User.alphabetical_group(params[:letter])
  end

  def new
    respond_with @user = User.new
  end

  def edit
    respond_with @user = User.find(params[:id])
  end

  def create
    respond_with @user = User.create(params[:user]), :location => users_url
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    respond_with @user, :location => users_url
  end
end
