class Vote < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :review, presence: true
  validates :user, presence: true

  validates :review_id, uniqueness: { scope: :user_id,
    message: "already voted" }
  # validate :nominator_cannot_vote_on_review

  # def nominator_cannot_vote_on_review
  #   if review.user == current_user
  #     errors.add(:review, "You wrote this review. Your vote does not count!")
  #   end
  # end
end
