class Api::V1::VotesController < ActionController::Base
  protect_from_forgery with: :null_session

  def index

  end

  def create
    vote = Vote.new(vote_params)
    if vote.save
      render json: :nothing, status: :created, location: api_v1_comments_path(comment)
    else
      render json: :nothing, status: :not_found
    end
  end

  private
  def vote_params
    params.require(:comment).permit(:revup_count, :revdown_count)
  end
end
