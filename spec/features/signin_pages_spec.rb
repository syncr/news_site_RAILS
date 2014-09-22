require 'rails_helper'

describe "the login process" do
  it "signs a user in who uses the right password" do
    visit '/users/new'
    fill_in "Email", :with => 'user@example.com'
    fill_in "Password", :with => 'password'
    fill_in "Password confirmation", :with => 'password'
    click_button "Sign Up"
    page.should have_content 'Account created.'
  end

  it "alerts the user when the username has been taken" do
    visit '/users/new'
    user = User.create(:email => 'user@example.com', :password => 'password')
    fill_in 'Email', :with => 'user@example.com'
    click_button "Sign Up"
    page.should have_content 'Email has already been taken'
  end

  it "alerts the user when the passwords don't match" do
    visit '/users/new'
    fill_in "Password", :with => 'password'
    fill_in "Password confirmation", :with => 'p4ssword'
    click_button "Sign Up"
    page.should have_content "Password confirmation doesn't match Password"
  end

  it "alerts the user when form fields are blank" do
    visit '/users/new'
    fill_in "Email", :with => ''
    fill_in "Password", :with => ''
    fill_in "Password confirmation", :with => ''
    click_button "Sign Up"
    page.should have_content "Password can't be blank"
  end
end
