require "rails_helper"

feature "user can edit venues and reviews" do
  let!(:review) { FactoryGirl.create(:review) }
  let!(:review_2) { FactoryGirl.create(:review) }
  let!(:venue) { review.venue }
  let!(:venue_2) { review_2.venue }
  let!(:user) { venue.user }
  let!(:user_2) { review.user }
  let!(:user_3) { venue_2.user }
  let!(:user_4) { review_2.user }

  scenario "user edits their own venue" do
    sign_in_as(user)

    visit venue_path(venue)
    expect(page).to have_content(venue.venue_name)

    click_button "Edit Venue"

    fill_in "Venue Name", with: "edited name"
    fill_in "Description", with: "edited description"
    fill_in "Street Address", with: "edited street rd"
    fill_in "State", with: "CA"
    fill_in "Zip Code", with: "11111"
    fill_in "City", with: "edited city"
    fill_in "Price Range", with: "5"

    click_button "Submit Changes"

    expect(page).to have_content("edited name")
    expect(page).to have_content("edited description")
  end

  scenario "user cannot edit another user's venue" do
    sign_in_as(user_2)

    visit venue_path(venue)
    expect(page).to have_content(venue.venue_name)

    expect(page).to_not have_content("Edit Venue")
  end

  scenario "user edits their own review" do
    sign_in_as(user_2)

    visit venue_path(venue)
    expect(page).to have_content(venue.venue_name)

    click_button "Edit Review"

    choose("5")
    fill_in "Your Review", with: "edited body"

    click_button "Submit Changes"

    expect(page).to have_content("edited body")
    expect(page).to have_content("🌟 🌟 🌟 🌟 🌟")
  end

  scenario "user cannot edit another user's venue" do
    sign_in_as(user)

    visit venue_path(venue)
    expect(page).to have_content(venue.venue_name)

    expect(page).to_not have_content("Edit Review")
  end
end
