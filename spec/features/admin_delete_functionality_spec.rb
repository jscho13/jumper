require "rails_helper"

feature "admin can delete reviews, venues, and users" do
  let!(:admin) { FactoryGirl.create(:user, role: "admin") }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:review) { FactoryGirl.create(:review) }
  let!(:venue) { review.venue }

  scenario "admin deletes a venue" do
    sign_in_as(admin)

    visit venue_path(venue)
    expect(page).to have_content(venue.venue_name)

    click_on("Delete Venue")
    expect(page).to_not have_content(venue.venue_name)
  end

  scenario "admin deletes a review" do
    sign_in_as(admin)

    visit venue_path(venue)
    expect(page).to have_content(review.review_body)

    click_button "Delete Review"
    expect(page).to_not have_content(review.review_body)
  end

  scenario "admin deletes a user" do
    sign_in_as(admin)

    visit admin_users_path
    expect(page).to have_content(user.username)

    find("##{user.id}").click
    expect(page).to_not have_content(user.username)
  end
end
