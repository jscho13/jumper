class VenuesController < ApplicationController
  def index
    if params[:query]
      @venues = Venue.search_by_venue_name(params[:query])
      @reviews = Review.search_by_review_body(params[:query])
    else
      @venues = Venue.all
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @reviews = @venue.reviews
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      flash.notice = "Venue added successfully"
      redirect_to venues_path
    else
      flash.notice = @venue.errors.full_messages.join(". ")
      render "new"
    end
  end

  def search

  end

  private

  def venue_params
    params.require(:venue).permit(
      :venue_name,
      :street_name,
      :state,
      :zip_code,
      :city,
      :description,
      :price_range
    )
  end
end
