class UsersController < ApplicationController

  def index
  end

  def edit
    @user = current_user
  end

  # def update
  #   @user = current_user
  #   binding.pry
  #   @user.avatar = params[:question]["title"]
  #   @user.description = params[:question]["description"]
  #
  #   if @user.save
  #     flash[:notice] = "Question edited successfully"
  #     redirect_to @user
  #   else
  #     flash[:notice] = "Question not edited successfully. It must be 140 characters long."
  #     redirect_to edit_question_path
  #   end
  # end
  #
  # protected
  #
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:account_update) << :avatar
  # end

end
