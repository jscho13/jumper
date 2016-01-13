require "rails_helper"

feature "user venue deletion" do
  let!(:review) { FactoryGirl.create(:review) }
  let!(:review_2) { FactoryGirl.create(:review) }
  let!(:venue) { review.venue }
  let!(:venue_2) { review_2.venue }
  let!(:user) { venue.user }
  let!(:user_2) { review.user }
  let!(:user_3) { venue_2.user }
  let!(:user_4) { review_2.user }

  scenario "user deletes their own venue" do
    sign_in_as(user)

    visit venues_path
    expect(page).to have_content(venue.venue_name)

    click_link venue.venue_name

    click_button "Delete Venue"
    expect(page).to_not have_content(venue.venue_name)
  end

  scenario "user cannot delete another user's venue" do
    sign_in_as(user)

    visit venues_path
    expect(page).to have_content(venue_2.venue_name)

    click_link venue_2.venue_name
    expect(page).to_not have_content("Delete Venue")
  end
end
