class UsersController < ApplicationController

  def index
  end

  def edit
    @user = current_user
  end

  def update
    u = User.new
    u.avatar = params[:user][:avatar]
    binding.pry
    if u.save!
      
    else

    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end
end
