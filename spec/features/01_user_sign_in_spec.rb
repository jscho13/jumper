require 'rails_helper'

feature "sees sign in options" do
  scenario "see all sign in options" do
    visit user_index_path
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Sign Out')
  end

  scenario "user successfully signs in" do
    user = FactoryGirl.create(:email)
    user_password = FactoryGirl.create(:password)

    visit user_sign_in_path
    click_on 'Sign In'
    fill_in 'Email', :with => user
    fill_in 'Password', :with => user_password

    expect(page).to have_content(user.email)
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
