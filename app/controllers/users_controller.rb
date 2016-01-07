class UsersController < ApplicationController
  def index
  end

  def edit
    @user = current_user
  end

  def create
    @results = PgSearch.multisearch(params[:query])
  end
end
