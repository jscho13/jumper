require "rails_helper"

feature "authorization" do
  let!(:venue) { FactoryGirl.create(:venue) }
  let!(:review) { FactoryGirl.create(:review, venue_id: venue.id) }

  scenario "redirects when not authorized to create review" do
    visit venues_path
    click_link venue.venue_name
    click_link "Add a New Review"

    expect(page).to have_content("Log in before reviewing!")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end

  scenario "can't directly access new_venue_review_path when not logged in" do
    visit new_venue_review_path(venue)

    expect(page).to have_content("Log in before reviewing!")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end

  scenario "redirects when not authorized to create venue" do
    visit venues_path
    click_link "Add a New Venue!"

    expect(page).to have_content("Log in before adding a new venue!")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end

  scenario "user can't directly access new_venue_path when not logged in" do
    visit new_venue_path

    expect(page).to have_content("Log in before adding a new venue!")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end
end
