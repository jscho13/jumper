class StateValidator < ActiveModel::Validator
  def validate(record)
   state_array = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
   unless state_array.include?(record.state)
     record.errors[:name] << 'Need a proper state acronym'
   end
 end
end

class Venue < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with StateValidator
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
