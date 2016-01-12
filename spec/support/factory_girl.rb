require 'faker'
FactoryGirl.find_definitions
include ApplicationHelper

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "SayWhaaaaatttt#{n}" }
    sequence(:email) { |n| "faketestuser#{n}@example.com" }
    sequence (:password) { |n| "password#{n}" }
  end

  factory :venue do
    sequence(:venue_name) { |n| "GD BARDEN#{n}" }
    sequence(:description) { |n| "here's a description #{n}" }
    sequence(:street_name) { |n| "#{n} streetroad ln" }
    sequence(:state) { |n| Venue::STATES[n % 50 + 1] }
    sequence(:zip_code) { |n| "#{n}1234"[0..4] }
    sequence(:city) { |n| "COOL CITY #{n}" }
    sequence(:price_range) {|n| "#{n % 4 + 1}"}
    user
  end

  factory :review do
    sequence(:rating) { |n| n % 5 + 1}
    sequence(:review_body) { |n| "This is a review #{n}" }
    venue
    user
  end
end
