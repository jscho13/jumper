class ReviewsController < ApplicationController
  def new
    @venue = Venue.find(params[:venue_id])
    @review = Review.new
    @quantity_collection = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5]]
  end

  def create
    @quantity_collection = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5]]
    @venue = Venue.find(params[:venue_id])
    # @review = Venue.reviews.new(review_params)
    @review = Review.new(review_params)
    @review.venue = @venue
    @review.user = current_user
    if @review.save
      flash.notice = "review added successfully"
      redirect_to venue_path(@venue)
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
