require "rails_helper"

feature "user review deletion" do
  let!(:review) { FactoryGirl.create(:review) }
  let!(:review_2) { FactoryGirl.create(:review) }
  let!(:venue) { review.venue }
  let!(:venue_2) { review_2.venue }
  let!(:user) { venue.user }
  let!(:user_2) { review.user }
  let!(:user_3) { venue_2.user }
  let!(:user_4) { review_2.user }

  scenario "user deletes their own review" do
    sign_in_as(user_2)

    visit venues_path
    click_link venue.venue_name
    expect(page).to have_content(review.review_body)

    click_button "Delete Review"
    expect(page).to_not have_content(review.review_body)
  end

  scenario "user cannot delete another user's review" do
    sign_in_as(user)

    visit venues_path
    expect(page).to have_content(venue_2.venue_name)

    click_link venue_2.venue_name
    expect(page).to_not have_content("Delete Review")
  end
end
