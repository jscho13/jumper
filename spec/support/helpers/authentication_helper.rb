module AuthenticationHelper
  def sign_in_as(user)
    visit "/"
    click_link "Sign In"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  def sign_up_as(user)
    visit '/'
    click_link 'Sign In'
    click_on 'Sign up'
    fill_in 'Username', with: user.username+"1"
    fill_in 'Email', with: user.email+"1"
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'
  end
end
