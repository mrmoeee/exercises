require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content('Sign Up')
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url 
      fill_in 'username', with: 'Fred' 
      fill_in 'email', with: 'freddy' 
      fill_in 'password', with: 'longboii' 

      click_button('Sign Up!')
    end
    scenario 'shows username on the homepage after signup' do 
      expect(page).to have_content('Fred') 
    end

  end
end

feature 'logging in' do
  background(:each) do
    user = User.new(username: 'Fred', email: 'freddy')
    user.password = 'longboii'
    user.save!
    visit new_session_url
    fill_in 'username', with: 'Fred'
    fill_in 'email', with: 'freddy' 
    fill_in 'password', with: 'longboii' 
    
    click_button('Login')
  end
  scenario 'shows username on the homepage after login' do 
    expect(page).to have_content('Fred')
  end

end

feature 'logging out' do
  background(:each) do
    user = User.new(username: 'Fred', email: 'freddy')
    user.password = 'longboii'
    user.save!
    visit new_session_url
    fill_in 'username', with: 'Fred'
    fill_in 'email', with: 'freddy' 
    fill_in 'password', with: 'longboii' 
    
    click_button('Login')
    click_button('Logout')
  end
  
  scenario 'begins with a logged out state' do 

    expect(page).to_not have_content('Logout')
  end

  scenario 'doesn\'t show username on the homepage after logout' do 
    #upon clicking log out, expect to not hav e logout button 
    expect(page).to_not have_content('Fred')
  end

end