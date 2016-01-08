class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
    @reviews = @venue.reviews
    # @upvotes = Vote.where("voteable_id = ? AND votes = ?", review.id, true )
    # @downvotes = Vote.where("voteable_id = ? AND votes = ?", review.id, false )
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

  def update
    @venue = Venue.find(params[:id])
    @user = User.where("username = ?", current_user.username).first
    @up_check = params.select{|key,value| value == "helpful"}.keys[0]
    @down_check = params.select{|key,value| value == "not helpful"}.keys[0]

    if @up_check
      review = Review.find(@up_check[6..-1])

      if !@user.voted_on?(review)
        @user.vote_for(review)
      elsif @user.voted_for?(review)
        @user.unvote_for(review)
      elsif @user.voted_against?(review)
        @user.unvote_for(review)
        @user.vote_for(review)
      end

    elsif @down_check
      review = Review.find(@down_check[8..-1])

      if !@user.voted_on?(review)
        @user.vote_against(review)
      elsif @user.voted_against?(review)
        @user.unvote_for(review)
      elsif @user.voted_for?(review)
        @user.unvote_for(review)
        @user.vote_against(review)
      end
    end
    redirect_to venue_path
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
