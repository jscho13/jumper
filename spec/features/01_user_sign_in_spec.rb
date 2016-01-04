require 'rails_helper'

feature "sees sign in options" do
  scenario "signs up" do
    user = FactoryGirl.create(:email)
    visit '/'
    expect(page).to have_content('Log in')
    fill_in 'Email', :with => user
    fill_in 'Password', :with => user_password
  end

  scenario "user is already signed" do
    visit '/'
    expect(page).to have_content('Sign in')
    expect(page).to have_content('Sign out')
  end

  scenario "user successfully signs out" do
    user = FactoryGirl.create(:email)
    user_password = FactoryGirl.create(:password)

    visit user_sign_in_path
    click_on 'Sign In'
    fill_in 'Email', :with => user
    fill_in 'Password', :with => user_password
    click_on 'Sign Out'

    expect(page).to have_content('You have successfully signed out')
  end

end
