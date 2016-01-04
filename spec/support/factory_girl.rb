require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    username "mcho1ampa"
    sequence(:username) { |n| "The answer to your question is located in the docs#{n}." }
    sequence(:question_id) { |n| n-1 }
  end
end
