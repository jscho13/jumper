require 'rails_helper'

feature "user can view their profile" do
  scenario "user visits user profile page" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    visit "/users/#{user.id}"

    expect(page).to have_content(user.username)
  end

  scenario "user can edit their profile" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    visit "/users/#{user.id}"
    click_on "Edit Profile"

    expect(page).to have_content('Edit User')
  end

  scenario "user can successfully edit their username" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    visit "/users/#{user.id}"
    click_on "Edit Profile"
    fill_in "Username", with: "wasbaiii"
    fill_in "Current password", with: user.password
    click_on 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
  end
end
