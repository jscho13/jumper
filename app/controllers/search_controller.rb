class SearchController < ApplicationController
  def index
    if params[:query]
      @venues = Venue.search_by_venue_name(params[:query])
      @reviews = Review.search_by_review_body(params[:query])
    end
  end
end
