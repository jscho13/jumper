require 'faker'
FactoryGirl.find_definitions

FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password {Faker::Internet.password}
  end

  factory :activity do
    activity_name {Faker::Hipster.word}
    description {Faker::Hipster.paragraph}
    sequence(:venue_id) { |n| "#{n}" }
    price_range "2"
  end

  factory :review do
    rating 5
    review_body {Faker::Hipster.paragraph}
    activity_id 1
    user_id 1
  end
end
