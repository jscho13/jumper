class SearchController < ApplicationController
  def index
    if params[:query]
      @venues = Venue.search_by_venue(params[:query])
      @reviews = Review.search_by_review(params[:query])
      @users = User.search_by_username(params[:query])
      @users.each do |user|
        @venues << user.venues
        @venues = @venues.flatten
        @reviews << user.reviews
        @reviews = @reviews.flatten
      end
    end
  end
end
