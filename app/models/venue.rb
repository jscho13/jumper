class Venue < ActiveRecord::Base
  validates :venue_name, presence: true
  validates :street_name, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, length: { is: 5 }
  validates :zip_code, numericality: { only_integer: true }
  validates :city, presence: true
  validates :user_id, presence: true

  has_many :reviews
  belongs_to :user
end
