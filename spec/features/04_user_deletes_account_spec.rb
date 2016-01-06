require 'rails_helper'

feature "user deletes their account" do
  scenario "user wants to delete their account" do
    visit '/'
    click_on 'Sign In'
    click_on 'Sign up'
    fill_in 'Username', with: Faker::Internet.user_name
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Password', with: 'hello1234TEST'
    fill_in 'Password confirmation', with: 'hello1234TEST'
    click_on 'Sign up'
    click_on "Profile"
    click_on "Edit Profile"
    click_on "Cancel My Account"

    expect(page).to have_content('Bye! Your account has been successfully' + \
    ' cancelled. We hope to see you again soon.')
  end
end
