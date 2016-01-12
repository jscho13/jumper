require 'faker'
FactoryGirl.find_definitions

STATE_ARRAY = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT",
  "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS",
  "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO",
  "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND",
  "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX",
  "UT", "VT", "VA", "WA", "WV", "WI", "WY"]

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "SayWhaaaaatttt#{n}" }
    sequence(:email) { |n| "faketestuser#{n}@example.com" }
    password { Faker::Internet.password }
  end

  factory :venue do
    venue_name { Faker::Hipster.word }
    description { Faker::Hipster.paragraph }
    street_name { Faker::Address.street_address }
    state { STATE_ARRAY.sample }
    zip_code { Faker::Address.zip[0..4] }
    city { Faker::Address.city }
    price_range "2"
    user
  end

  factory :review do
    rating 5
    review_body { Faker::Hipster.paragraph }
    venue
    user
  end
end
