require 'rails_helper'

feature "sees sign in options" do
  scenario "user visits index page" do
    visit '/'
    expect(page).to have_content('Sign In')
  end

  scenario "user succesfully signs in" do
    user = FactoryGirl.create(:user)
    visit '/'
    sign_in_as(user)
    expect(page).to have_content('Signed in successfully.')
  end

  scenario "user successfully signs out" do
    user = FactoryGirl.create(:user)
    visit '/'
    sign_in_as(user)
    click_on 'Sign Out'
    expect(page).to have_content('Signed out successfully.')
  end

  scenario "user can sign up" do
    visit '/'
    click_on 'Sign In'
    click_on 'Sign up'
    fill_in 'Username', with: Faker::Internet.user_name
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Password', with: 'hello1234TEST'
    fill_in 'Password confirmation', with: 'hello1234TEST'
    click_on 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
