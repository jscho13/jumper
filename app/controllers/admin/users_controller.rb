class Admin::UsersController < ApplicationController
  include ApplicationHelper
  before_action :authorize_user, only: [:destroy, :index]

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to admin_users_path
  end
end
