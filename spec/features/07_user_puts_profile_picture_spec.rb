# spec/features/profile_photo_spec.rb
require "rails_helper"

feature "profile photo" do
  scenario "user uploads a profile photo" do
    visit root_path
    click_link "Sign In"
    click_link "Sign up"

    fill_in "Username", with: "jscho13"
    fill_in "Email", with: "ash@s-mart.com"
    fill_in "Password", with: "boomstick!3vilisd3ad"
    fill_in "Password confirmation", with: "boomstick!3vilisd3ad"
    attach_file "Profile Photo", "#{Rails.root}/spec/support/images/doge.jpeg"
    click_button "Sign up"

    user = User.last
    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_xpath(
      "//img[@src=\"/uploads/user/avatar/#{user.id}/doge.jpeg\"]")
  end
end
