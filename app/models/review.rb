class Review < ActiveRecord::Base
  validates :rating, presence: true
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
  }
  validates :venue_id, presence: true
  validates :user, presence: true

  belongs_to :venue
  belongs_to :user

  def deletable_by(user)
    return false if user.nil?
    user.admin? || self.user == user
  end
end
