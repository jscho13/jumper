class UsersController < ApplicationController

  def index
  end

  def edit
    @user = current_user
  end
end
