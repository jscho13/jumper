require 'rails_helper'

feature "user deletes their account" do
  scenario "user wants to delete their account" do
    user = FactoryGirl.create(:user)
    sign_up_as(user)
    click_on "Profile"
    click_on "Edit Profile"
    click_on "Cancel My Account"

    expect(page).to have_content('Bye! Your account has been successfully' + \
    ' cancelled. We hope to see you again soon.')
  end
end
