require 'rails_helper'

# [] Visiting the `/activities` path should contain a list of restaurants.
# [] Visiting the `/activities/10 path should show the details for a activity with the ID of 10.
# [] Visiting the root path should display a list of all activities.

feature "user sees a list of his/her activities" do
  before(:each) do
    @bodaborg = Activity.create(activity_name: "BodaBorg",    description: "20 challenging mental and physical courses", venue_id: 1, price_range: 2)

    @skyzone = Activity.create(activity_name: "Trampoline Dodgeball", description: "Exactly as described", venue_id: 2, price_range: 1)
  end

  scenario "sees a list of activities and link for new activity" do
    visit activities_path

    expect(page).to have_content @bodaborg.activity_name
    expect(page).to have_link @skyzone.activity_name

    click_link "Add a New Activity!"

    expect(page).to have_content "New Activity Form"
  end

  scenario "clicks link and is taken to show page for given activity" do
    visit activities_path

    click_link "BodaBorg"

    expect(page).to have_content @bodaborg.activity_name
    expect(page).to have_content @bodaborg.description

    click_link "All Activities"
  end

  scenario "add new activity" do
    visit new_activity_path

    fill_in "Activity Name", with: "Bouldering"
    fill_in "Description", with: "Climb 25 feet high wall with only your bare hands"
    fill_in "Venue", with: "Central Rock Gym"
    fill_in "Price Range", with: "$$"

    click_button "Add Activity"

    expect(page).to have_content "Bouldering"
  end
end
