require 'rails_helper'

# [] Visiting the `/activities` path should contain a list of restaurants.
# [] Visiting the `/activities/10 path should show the details for a hobby with the ID of 10.
# [] Visiting the root path should display a list of all activities.

feature "user sees a list of his/her activities" do
  scenario "sees a list of activities and link for new hobby" do

    bodaborg = Activity.create(activity_name: "BodaBorg", description: "20 challenging mental and physical courses", venue_id: 1, price_range: 2)
    skyzone = Activity.create(activity_name: "Trampoline Dodgeball", description: "Exactly as described", venue_id: 2, price_range: 1)

    visit activities_path

    expect(page).to have_content bodaborg.activity_name
    expect(page).to have_link skyzone.activity_name
  end
end
