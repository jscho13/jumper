require "rails_helper"

feature "user does not have admin access" do
  let!(:review) { FactoryGirl.create(:review) }
  let!(:review_2) { FactoryGirl.create(:review) }
  let!(:venue) { review.venue }
  let!(:venue_2) { review_2.venue }
  let!(:user) { venue.user }
  let!(:user_2) { review.user }
  let!(:user_3) { venue_2.user }
  let!(:user_4) { review_2.user }

  scenario "user cannot access admin functionalities" do
    sign_in_as(user)

    visit venues_path
    expect(page).to_not have_content("Delete Venue")
    expect(page).to_not have_content("Delete Review")

    expect { visit admin_users_path
    }.to raise_error(ActionController::RoutingError)
  end
end
