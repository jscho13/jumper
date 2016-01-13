class Vote < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :review, presence: true
  validates :user, presence: true

  validates :review_id, uniqueness: {
    scope: :user_id,
    message: "already voted"
  }
end
