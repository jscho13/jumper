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
    click_on 'helpful'

    expect(page).to have_content review.review_body
  end
end
