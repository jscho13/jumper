require 'rails_helper'

# [] Visiting the `/venues` path should contain a list of restaurants.
# [] Visiting the `/venues/10 path should show the details for a venue
#    with the ID of 10.
# [] Visiting the root path should display a list of all venues.

feature "user sees a list of his/her venues" do
  before(:each) do
    @bodaborg = FactoryGirl.create(:venue)
    @skyzone = FactoryGirl.create(:venue)
  end

  scenario "sees a list of venues and link for new venue" do
    visit venues_path

    expect(page).to have_content @bodaborg.venue_name
    expect(page).to have_link @skyzone.venue_name

    click_link "Add a New Venue!"

    expect(page).to have_content "New Venue Form"
  end

  scenario "clicks link and is taken to show page for given venue" do
    visit venues_path

    click_link @bodaborg.venue_name

    expect(page).to have_content @bodaborg.venue_name
    expect(page).to have_content @bodaborg.description

    click_link "All Activities"
  end

  scenario "add new venue" do
    visit new_venue_path

    fill_in "Venue Name", with: "Bouldering"
    fill_in "Description", with: "Climb 25 feet wall with only your bare hands"
    fill_in "Venue", with: "Central Rock Gym"
    fill_in "Price Range", with: "$$"

    click_button "Add Venue"

    expect(page).to have_content "Bouldering"
  end
end
