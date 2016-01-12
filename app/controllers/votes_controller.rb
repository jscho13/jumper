class VotesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @venue = Venue.find(params[:venue_id])
    @review = Review.new
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :review_body
    )
  end
end
