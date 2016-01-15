class SearchController < ApplicationController
  def index
    if params[:query]
      page_count = params[:page]
      @venues = Venue.venue_search(params[:query]).page(page_count).per(10)
      @reviews = Review.review_search(params[:query]).page(page_count).per(10)
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
