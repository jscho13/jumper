# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

User.create(
  username: "a",
  email: "a@a.com",
  password: "12341234",
  role: "admin"
)

20.times do
  User.create(
    username: Faker::App.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8, 16)
  )
end

50.times do
  Venue.create(
    venue_name: Faker::Hacker.noun,
    description: Faker::Hacker.say_something_smart,
    street_name: Faker::Address.street_address,
    state: Venue::STATES.sample,
    zip_code: Faker::Address.zip[0..4],
    city: Faker::Address.city,
    price_range: rand(5) + 1,
    user_id: User.all.sample.id
  )
end

500.times do
  Review.create(
    rating: rand(5) + 1,
    review_body: Faker::Hipster.paragraph,
    venue_id: Venue.all.sample.id
    user_id: User.all.sample.id
  )
end
