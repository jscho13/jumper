class ReviewsController < ApplicationController

  def new
    @activity = Activity.find(params[:activity_id])
    @review = Review.new
    @quantity_collection = [[1,1], [2,2], [3,3], [4,4], [5,5]]
  end

  def create
    @quantity_collection = [[1,1], [2,2], [3,3], [4,4], [5,5]]
    @activity = Activity.find(params[:activity_id])
    @review = Review.new(review_params)
    @review.activity = @activity
    @review.user_id = 1
    if @review.save
      flash.notice = "review added successfully"
      redirect_to activity_path(@activity)
    else
      flash.notice = @review.errors.full_messages.join(". ")
      render "new"
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :review_body
    )
  end
end
