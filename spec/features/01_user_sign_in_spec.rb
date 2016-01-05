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
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Users')
  end

  scenario "user successfully signs out" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    click_on 'Sign Out'
    expect(page).to have_content('Users')
  end

end
