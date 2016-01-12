class Venue < ActiveRecord::Base
  validates :venue_name, presence: true
  validates :street_name, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, length: { is: 5 }
  validates :zip_code, numericality: { only_integer: true }
  validates :city, presence: true
  validates :user, presence: true

  has_many :reviews
  belongs_to :user

  def deletable_by(user)
    user ? (user.admin? || self.user_id == user.id) : false
  end
end
