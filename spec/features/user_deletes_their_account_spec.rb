require "rails_helper"

feature "user account deletion" do
  let!(:review) { FactoryGirl.create(:review) }
  let!(:review_2) { FactoryGirl.create(:review) }
  let!(:venue) { review.venue }
  let!(:venue_2) { review_2.venue }
  let!(:user) { venue.user }
  let!(:user_2) { review.user }
  let!(:user_3) { venue_2.user }
  let!(:user_4) { review_2.user }
  scenario "user can cancel their account" do
    sign_in_as(user)

    visit edit_user_registration_path

    click_button "Cancel My Account"

    expect(page).to have_content("Your account has been successfully cancelled")
    sign_in_as(user)
    expect(page).to have_content("Invalid email or password.")
  end
end
