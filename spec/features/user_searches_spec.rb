require "rails_helper"

feature "user uses search bar" do
  let!(:review) { FactoryGirl.create(:review) }
  let!(:venue) { review.venue }
  let!(:user) { venue.user }

  scenario "user searches by venue" do
    sign_in_as(user)

    visit venues_path
    fill_in "query", with: venue.venue_name
    click_button "Search"
    expect(page).to have_content(venue.venue_name)
  end

  scenario "user searches by review" do
    sign_in_as(user)

    visit venues_path
    fill_in "query", with: review.review_body
    click_button "Search"
    expect(page).to have_content(review.review_body)
  end

  scenario "user searches by username" do
    sign_in_as(user)

    visit venues_path
    fill_in "query", with: user.username
    click_button "Search"
    expect(page).to have_content(venue.venue_name)
  end
end
