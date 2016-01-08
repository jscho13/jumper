require "rails_helper"

feature "authorization" do
  let!(:venue) { FactoryGirl.create(:venue) }
  let!(:review) { FactoryGirl.create(:review, venue_id: venue.id) }

  scenario "can't create new review if not logged in" do
    visit venues_path
    click_link venue.venue_name
    click_link "Add a New Review"

    choose "4"
    fill_in "Your Review", with: "Cool"
    click_button "Add review"

    expect(page).to have_content("Please log in")
  end
end
