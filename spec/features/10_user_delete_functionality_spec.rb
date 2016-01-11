require "rails_helper"

feature "user can delete their reviews and venues" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:review) { FactoryGirl.create(:review, venue_id: venue.id) }
  let!(:review_2) { FactoryGirl.create(:review, creator_id: 99, venue_id: venue_2.id) }
  let!(:venue) { review.venue }
  let!(:venue_2) { review.venue, creator_id: 99) }
  # let!(:venue) { FactoryGirl.create(:venue) }
  # let!(:venue_2) { FactoryGirl.create(:venue, creator_id: 99) }

  scenario "user deletes a venue" do
    sign_in_as(user)

    visit venues_path
    expect(page).to have_content(venue.description)

    click_link venue.description
    click_link "Delete Venue"
    expect(page).to_not have_content(venue.description)
  end

  scenario "user cannot delete another venue" do
    sign_in_as(user)

    visit venues_path
    expect(page).to have_content(venue_2.description)

    click_link venue_2.description
    expect(page).to_not have_content("Delete Venue")
  end

  scenario "user deletes a review" do
    sign_in_as(user)

    visit venues_path
    expect(page).to have_content(review.description)
    click_link venue.description

    click_link "Delete Review"
    expect(page).to_not have_content(review.review_body)
  end

  scenario "user cannot dlete another review" do
    sign_in_as(user)

    visit venues_path
    expect(page).to have_content(venue_2.description)

    click_link venue_2.description
    expect(page).to_not have_content("Delete Review")
  end

  scenario "user cannot access admin functionalities" do
    sign_in_as(user)

    visit venues_path
    expect(page).to_not have_content("Delete Venue")
    expect(page).to_not have_content("Delete Review")

    visit admin_users_path
    expect(page).to have_content("Not Found")
  end

  scenario "user cannot access admin functionalities" do
    sign_in_as(user)

    visit venues_path
    expect(page).to_not have_content("Delete Venue")
    expect(page).to_not have_content("Delete Review")

    visit admin_users_path
    expect(page).to have_content("Not Found")
  end


end
