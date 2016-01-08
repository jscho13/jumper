class Review < ActiveRecord::Base
  validates :rating, presence: true
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
  }
  validates :venue_id, presence: true
  validates :user_id, presence: true

  belongs_to :venue
  belongs_to :user

  include PgSearch
  pg_search_scope :search_by_review_body,
    against: :review_body,
    :using => {
                :tsearch => {:prefix => true}
              }
end
