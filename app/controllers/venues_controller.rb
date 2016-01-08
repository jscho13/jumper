class VenuesController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    if params[:query]
      @venues = Venue.search_by_venue_name(params[:query])
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

  def authorize_user
    if !user_signed_in?
      flash.notice = "Log in before adding a new venue!"
      redirect_to user_session_path
    end
  end
end
