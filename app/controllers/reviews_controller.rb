class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @venue = Venue.find(params[:venue_id])
    @review = Review.new
    @quantity_collection = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5]]
  end

  def create
    @quantity_collection = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5]]

    @venue = Venue.find(params[:venue_id])
    @review = @venue.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      ReviewMailer.new_review(@review, @venue).deliver_later
      binding.pry
      flash.notice = "review added successfully"
      redirect_to venue_path(@venue)
    else
      flash.notice = @review.errors.full_messages.join(". ")
      render "new"
    end
  end

  def edit
    @venue = Venue.find(params[:venue_id])
    @review = Review.find(params[:id])
    @quantity_collection = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5]]
  end

  def destroy
    @review = Review.find(params[:id])
    @venue = Venue.find(@review.venue_id)
    @review.destroy
    redirect_to venue_path(@venue)
  end

  def update
    @quantity_collection = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5]]

    @venue = Venue.find(params[:venue_id])
    @review = Review.find(params[:id])
    @review.update(review_params)

    if @review.save
      flash.notice = "review added successfully"
      redirect_to venue_path(@venue)
    else
      flash.notice = @review.errors.full_messages.join(". ")
      render "edit"
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
