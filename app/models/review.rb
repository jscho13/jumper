class Review < ActiveRecord::Base
  validates :rating, presence: true
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
  }
  validates :activity_id, presence: true
  validates :user_id, presence: true

  belongs_to :activity
  belongs_to :user
end
