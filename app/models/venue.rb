class Venue < ActiveRecord::Base

  STATES = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL",
    "GA","HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
    "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM",
    "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN",
    "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]

  validates :venue_name, presence: true
  validates :street_name, presence: true
  validates :state, presence: true, inclusion: { in: STATES }
  validates :zip_code, presence: true, length: { is: 5 }
  validates :zip_code, numericality: { only_integer: true }
  validates :city, presence: true
  validates :user, presence: true

  has_many :reviews
  belongs_to :user

  def deletable_by(user)
    return false if user.nil?
    user.admin? || self.user == user
  end
end
