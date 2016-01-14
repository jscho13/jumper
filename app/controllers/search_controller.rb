class SearchController < ApplicationController
  def index
    if params[:query]
      @venues = Venue.search_by_venue_name(params[:query]).page(params[:page]).per(10)
      @reviews = Review.search_by_review_body(params[:query]).page(params[:page]).per(10)
    end
  end
end
