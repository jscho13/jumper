require 'rails_helper'

feature "sees sign in options" do
  scenario "user visits index page" do
    visit '/'
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Sign Out')
  end

  scenario "user succesfully signs in" do
    user = FactoryGirl.create(:user)
    visit '/'
    sign_in_as(user)
    expect(page).to have_content('Sign In')
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
    user = FactoryGirl.build(:user)
    visit '/'
    click_link 'Sign In'
    click_on 'Sign up'
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
