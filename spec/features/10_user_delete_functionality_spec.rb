require "rails_helper"

feature "user can delete their reviews and venues" do
  let!(:review) { FactoryGirl.create(:review) }
  let!(:review_2) { FactoryGirl.create(:review) }
  let!(:venue) { review.venue }
  let!(:venue_2) { review_2.venue }
  let!(:user) { venue.user }
  let!(:user_2) { review.user }
  let!(:user_3) { venue_2.user }
  let!(:user_4) { review_2.user }

  scenario "user deletes a venue" do
    sign_in_as(user)

    visit venues_path
    expect(page).to have_content(venue.venue_name)

    click_link venue.venue_name

    click_button "Delete Venue"
    expect(page).to_not have_content(venue.venue_name)
  end

  scenario "user cannot delete another venue" do
    sign_in_as(user)

    visit venues_path
    expect(page).to have_content(venue_2.venue_name)

    click_link venue_2.venue_name
    expect(page).to_not have_content("Delete Venue")
  end

  scenario "user deletes a review" do
    sign_in_as(user_2)

    visit venues_path
    click_link venue.venue_name
    expect(page).to have_content(review.review_body)

    click_button "Delete Review"
    expect(page).to_not have_content(review.review_body)
  end

  scenario "user cannot delete another review" do
    sign_in_as(user)

    visit venues_path
    expect(page).to have_content(venue_2.venue_name)

    click_link venue_2.venue_name
    expect(page).to_not have_content("Delete Review")
  end

  scenario "user cannot access admin functionalities" do
    sign_in_as(user)

    visit venues_path
    expect(page).to_not have_content("Delete Venue")
    expect(page).to_not have_content("Delete Review")

    expect { visit admin_users_path }.to raise_error
  end
end
