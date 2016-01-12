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
      flash.notice = "review added successfully"
      redirect_to venue_path(@venue)
    else
      flash.notice = @review.errors.full_messages.join(". ")
      render "new"
    end
  end

  def update
    @venue = Venue.find(params[:venue_id])
    @review = Review.find(params[:id])
    vote = Vote.find_by(user: current_user, review: @review)
    if vote
      vote.destroy
      if vote.up
        if params[:up] == "true"
          @review.revup_count -= 1
        elsif params[:down] == "true"
          vote = @review.votes.new(user: current_user)
          vote.up = false
          @review.revup_count -= 1
          @review.revdown_count += 1
        end
      else
        if params[:up] == "true"
          vote = @review.votes.new(user: current_user)
          vote.up = true
          @review.revup_count += 1
          @review.revdown_count -= 1
        elsif params[:down]
          @review.revdown_count -= 1
        end
      end
    else
      vote = @review.votes.new(user: current_user, up: false)
      if params[:up] == "true"
          @review.revup_count += 1
          vote.up = true
      elsif params[:down] == "true"
        @review.revdown_count += 1
      end
    end
    if vote.save && @review.save
      flash[:notice] = "You have voted!"
      redirect_to venue_path(@venue)
    else
      flash[:notice] = vote.errors.full_messages.join(". ")
      redirect_to venue_path(@venue)
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
