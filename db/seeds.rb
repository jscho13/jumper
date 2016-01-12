# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
STATE_ARRAY = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]

User.create(username: "a",
email: "a@a.com",
password: "12341234",
role: "admin"
)

20.times do
  User.create(username: Faker::App.name,
  email: Faker::Internet.email,
  password: Faker::Internet.password(8, 16)
  )
end

50.times do
  Venue.create(venue_name: Faker::Hacker.noun,
  description: Faker::Hacker.say_something_smart,
  street_name: Faker::Address.street_address,
  state: STATE_ARRAY.sample,
  zip_code: Faker::Address.zip[0..4],
  city: Faker::Address.city,
  price_range: rand(5) + 1,
  user_id: rand(User.count) + 1
  )
end

500.times do
  Review.create(rating: rand(5) + 1,
  review_body: Faker::Hipster.paragraph,
  venue_id: rand(Venue.count) + 1,
  user_id: rand(User.count) + 1)
end
