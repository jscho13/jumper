require "rails_helper"

feature "user does not have admin access" do
  let!(:review) { FactoryGirl.create(:review) }
  let!(:venue) { review.venue }
  let!(:user) { venue.user }
  let!(:error_message) { ActionController::RoutingError }

  scenario "user cannot access admin functionalities" do
    sign_in_as(user)

    visit venues_path
    expect(page).to_not have_content("Delete Venue")
    expect(page).to_not have_content("Delete Review")

    expect { visit admin_users_path }.to raise_error(ActionController::RoutingError)
  end
end
