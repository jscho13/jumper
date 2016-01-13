class Api::ReviewsController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :show]

  def update
    @venue = Venue.find(params[:venue_id])
    @review = Review.find(params[:id])
    vote = Vote.find_by(user: current_user, review: @review)
    if vote
      if vote.up
        if params[:up] == "true"
          vote.destroy
          @review.revup_count -= 1
        elsif params[:down] == "true"
          vote.destroy
          vote = @review.votes.new(user: current_user)
          vote.up = false
          @review.revup_count -= 1
          @review.revdown_count += 1
        end
      else
        if params[:up] == "true"
          vote.destroy
          vote = @review.votes.new(user: current_user)
          vote.up = true
          @review.revup_count += 1
          @review.revdown_count -= 1
        elsif params[:down] == "true"
          vote.destroy
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
      if params[:load_javascript] == "false"
        redirect_to venue_path(@venue), method: "get"
      else
        render(json: @review.to_json)
      end
    else
      flash[:notice] = vote.errors.full_messages.join(". ")
      if params[:load_javascript] == "false"
        redirect_to venue_path(@venue)
      else
        render(json: @review.to_json)
      end
    end
  end
end
