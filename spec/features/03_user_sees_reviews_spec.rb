require 'rails_helper'

# [] Visiting the `/activities` path should contain a list of restaurants.
# [] Visiting the `/activities/10 path should show the details for a activity with the ID of 10.
# [] Visiting the root path should display a list of all activities.

feature "user sees a list of reviews for the given acitivty" do
  scenario "clicks link and is taken to show page for given activity" do

    @activity1 = FactoryGirl.create(:activity)
    @a_review = FactoryGirl.create(:review)
    @a_review.activity_id = @activity1.id
    @b_review = FactoryGirl.create(:review)
    @b_review.activity_id = @activity1.id
    
    visit activities_path

    click_link @activity1.activity_name

    expect(page).to have_content @activity1.activity_name
    expect(page).to have_content @activity1.description
    expect(page).to have_content @a_review.review_body

    click_link "All Activities"
  end
end
