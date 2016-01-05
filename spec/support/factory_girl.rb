require 'faker'
FactoryGirl.find_definitions

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "faketestuser#{n}@example.com" }
    password { Faker::Internet.password }
  end

  factory :activity do
    activity_name { Faker::Company.name }
    description { Faker::Company.catch_phrase }
    price_range "2"
  end

  factory :review do
    rating 5
    review_body { Faker::Lorem.paragraph }
    activity
    user
  end
end
