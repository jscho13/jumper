require 'rails_helper'

# [] Visiting the `/venues` path should contain a list of restaurants.
# [] Visiting the `/venues/10 path should show the details for a venue with the
# ID of 10.
# [] Visiting the root path should display a list of all venues.

feature "user sees a list of reviews for the given acitivty" do
  let!(:venue) { FactoryGirl.create(:venue) }
  let!(:review) { FactoryGirl.create(:review, venue_id: venue.id) }

  scenario "clicks link and is taken to show page for given venue" do
    visit venues_path
    click_link venue.venue_name

    expect(page).to have_content venue.venue_name
    expect(page).to have_content venue.description
    expect(page).to have_content review.review_body

    click_link "All Venues"
  end

  scenario "submit a new review" do
    visit venues_path
    click_link venue.venue_name
    click_link "Add a New Review"

    choose "4"
    fill_in "Your Review", with: "Cool"
    click_button "Add review"

    expect(page).to have_content("Cool")
    expect(page).to have_content("4")
  end
end
