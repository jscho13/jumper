class Admin::UsersController < ApplicationController
  before_action :authorize_user

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to admin_users_path
  end
end
