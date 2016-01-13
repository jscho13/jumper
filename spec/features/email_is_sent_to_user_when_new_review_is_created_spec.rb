require "rails_helper"

feature "admin can delete reviews, venues, and users" do
  # let!(:user) { FactoryGirl.create(:user) } self-13
  # let!(:user_2) { FactoryGirl.create(:user) } self-14
  let!(:venue) { FactoryGirl.create(:venue) }
  let!(:review_poster) { FactoryGirl.create(:user) }
  # let!(:venue_poster) { User.find(venue.user_id) }
  scenario "email is sent to the venue creator" do
    sign_in_as(review_poster)
    visit venues_path
    click_link venue.venue_name
    click_link "Add a New Review"

    choose "4"
    fill_in "Your Review", with: "Cool"
    click_button "Add review"

    binding.pry

    expect(ActionMailer::Base.deliveries.count).to eq(1)
    # mail_to = User.find(venue.user_id).email
  end
end
