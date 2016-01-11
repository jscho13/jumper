class VotesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @venue = Venue.find(params[:venue_id])
    @review = Review.new
  end

  def create_upvote
    @review = Review.find(params[:review_id])
    binding.pry
    @vote = @review.votes.new(user: current_user)
    if @vote.save
      flash[:notice] = "You have voted!"
      redirect_to venue_path(@venue)
    else
      flash[:error] = @vote.errors.full_messages.join
    end
    redirect_to venue_path(@venue)
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :review_body
    )
  end
end
