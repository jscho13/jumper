class Activity < ActiveRecord::Base
  validates :activity_name, presence: true
  has_many :reviews
end
