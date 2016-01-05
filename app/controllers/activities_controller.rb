class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
    # @reviews = @activity.reviews
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      flash.notice = "Activity added successfully"
      redirect_to activities_path
    else
      flash.notice = @activity.errors.full_messages.join(". ")
      render "new"
    end
  end

  private

  def activity_params
    params.require(:activity).permit(
      :activity_name,
      :description,
      :venue_id,
      :price_range
    )
  end
end