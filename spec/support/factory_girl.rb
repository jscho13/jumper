require 'factory_girl_rails'
FactoryGirl.find_definitions

FactoryGirl.define do
  factory :user do
    email "jscho13@gmail.com"
    password "Applied91"
  end
end
