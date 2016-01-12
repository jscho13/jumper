require 'rails_helper'


# [] Visiting the `/venues` path should contain a list of restaurants.
# [] Visiting the `/venues/10 path should show the details for a venue with the
# ID of 10.
# [] Visiting the root path should display a list of all venues.

feature "user sees a list of reviews for the given acitivty" do
 Capybara.default_max_wait_time = 5
 let!(:venue) { FactoryGirl.create(:venue) }
 let!(:review) { FactoryGirl.create(:review, venue_id: venue.id) }
 let!(:user) { FactoryGirl.create(:user) }

 scenario "upvote button counts vote +1" do
   sign_in_as(user)
   visit "/venues/#{venue.id}"
   page.find_by_id("review-#{review.id}").find_button("helpful").click
   visit "/venues/#{venue.id}"

   expect(page).to have_content "Helpful: 1"
 end

 scenario "downvote button counts vote -1" do
   sign_in_as(user)
   visit "/venues/#{venue.id}"
   click_button 'not helpful'
   visit "/venues/#{venue.id}"

   expect(page).to have_content "Not Helpful: 1"
 end

 scenario "only one button can be activated" do
   sign_in_as(user)
   visit "/venues/#{venue.id}"
   click_button 'not helpful'
   save_and_open_page
   click_button 'helpful'
   visit "/venues/#{venue.id}"

   expect(page).to have_content "Helpful: 1"
   expect(page).to have_content "Not Helpful: 0"
 end

 scenario "undo upvote" do
   sign_in_as(user)
   visit "/venues/#{venue.id}"
   click_button 'helpful'
   click_button 'helpful'

   expect(page).to have_content "Helpful: 0"
 end

 scenario "undo downvote" do
   sign_in_as(user)
   visit "/venues/#{venue.id}"
   click_button 'not helpful'
   click_button 'not helpful'

   expect(page).to have_content "Not Helpful: 0"
 end
end
