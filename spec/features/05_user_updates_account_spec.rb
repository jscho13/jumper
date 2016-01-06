require 'rails_helper'

feature "user updates their account" do
  scenario "user wants to update their account username" do
    user = FactoryGirl.create(:user)
    sign_up_as(user)
    click_on "Profile"
    click_on "Edit Profile"
    fill_in "Username", with: "abcd"
    fill_in "Current password", with: user.password
    click_on "Update"
    click_on "Profile"

    expect(page).to have_content('Welcome, abcd!')
  end

  scenario "user wants to update their account password" do
    user = FactoryGirl.create(:user)
    sign_up_as(user)
    click_on "Profile"
    click_on "Edit Profile"
    fill_in "Password", with: "abcd1234"
    fill_in "Password confirmation", with: "abcd1234"
    fill_in "Current password", with: user.password
    click_on "Update"
    click_on "Profile"

    expect(page).to have_content("Welcome, #{user.username}1!")
  end

  scenario "user wants to update their account email" do
    user = FactoryGirl.create(:user)
    sign_up_as(user)
    click_on "Profile"
    click_on "Edit Profile"
    fill_in "Email", with: "ab213@gmail.com"
    fill_in "Current password", with: user.password
    click_on "Update"
    click_on "Profile"

    expect(page).to have_content("Welcome, #{user.username}1!")
  end
end
