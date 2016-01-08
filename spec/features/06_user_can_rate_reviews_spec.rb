require 'rails_helper'


# [] Visiting the `/venues` path should contain a list of restaurants.
# [] Visiting the `/venues/10 path should show the details for a venue with the
# ID of 10.
# [] Visiting the root path should display a list of all venues.

feature "user sees a list of reviews for the given acitivty" do
  Capybara.default_max_wait_time = 5
  let!(:venue) { FactoryGirl.create(:venue) }
  let!(:review) { FactoryGirl.create(:review, venue_id: venue.id) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario "upvote button counts vote +1" do
    sign_in_as(user)
    visit "/venues/#{venue.id}"
    click_on 'helpful'
    visit "/venues/#{venue.id}"

    expect(page).to have_content "likes: 1"
  end

  scenario "downvote button counts vote -1" do
    sign_in_as(user)
    visit "/venues/#{venue.id}"
    click_on 'not helpful'
    visit "/venues/#{venue.id}"

    expect(page).to have_content "dislikes: 1"
  end

  scenario "only one button can be activated" do
    sign_in_as(user)
    visit "/venues/#{venue.id}"
    click_on 'not helpful'
    click_on 'helpful'
    visit "/venues/#{venue.id}"

    expect(page).to have_content "likes: 1"
    expect(page).to have_content "dislikes: 0"
  end

  scenario "undo upvote" do
    sign_in_as(user)
    visit "/venues/#{venue.id}"
    click_on 'helpful'
    click_on 'helpful'

    expect(page).to have_content "likes: 0"
  end

  scenario "undo downvote" do
    sign_in_as(user)
    visit "/venues/#{venue.id}"
    click_on 'not helpful'
    click_on 'not helpful'

    expect(page).to have_content "dislikes: 0"
  end

=begin
  scenario "the user successfully voted for helpful" do
  visit venues_path
  click_on 'helpful'


  expect(helpful_button).to_be active
  expect(page).to have_content "likes: 1"


  scenario "the user successfully voted for not helpful" do
  visit venues_path
  click_on 'not helpful'

  expect(helpful_button).to_be active
  expect(page).to have_content "dislikes: 1"

=end

end
