require 'rails_helper'

feature "sees sign in options" do
  scenario "signs up" do
    test_user = FactoryGirl.create(:user)
    visit '/'
    expect(page).to have_content('Log in')
    fill_in 'Email', :with => test_user.email
    fill_in 'Password', :with => test_user.password
    click_on 'Log in'
  end

  scenario "user is already signed" do
    user = FactoryGirl.create(:user)
    visit '/'
    expect(page).to have_content('Log in')
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Sign Out')
  end

  scenario "user successfully signs out" do
    user = FactoryGirl.create(:user)
    visit '/'
    expect(page).to have_content('Log in')
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'

    click_on 'Sign Out'
    expect(page).to have_content('Remember me')
  end

end
