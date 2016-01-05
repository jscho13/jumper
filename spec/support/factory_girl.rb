require 'faker'
FactoryGirl.find_definitions

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "SayWhaaaaatttt#{n}" }
    sequence(:email) { |n| "faketestuser#{n}@example.com" }
    password {Faker::Internet.password}
  end

  factory :activity do
    activity_name {Faker::Hipster.word}
    description {Faker::Hipster.paragraph}
    price_range "2"
  end

  factory :review do
    rating 5
    review_body {Faker::Hipster.paragraph}
    activity
    user
  end
end
