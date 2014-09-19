require 'rails_helper'

describe "the link create process" do
  it "allows user to input a unique story" do
    user = User.create(:email => 'user@example.com', :password => 'password')
    visit '/sessions/new'
    fill_in "Email", :with => 'user@example.com'
    fill_in "Password", :with => 'password'
    click_button "Log In"
    visit '/links/new'
    fill_in "link_headline", :with => 'This is amazing'
    fill_in "link_url", :with => 'www.amazing.com'
    click_button "Create Link"
    page.should have_content 'amazing'
  end

  it "prevents a user from entering a link without a URL" do
    user = User.create(:email => 'user@example.com', :password => 'password')
    visit '/sessions/new'
    fill_in "Email", :with => 'user@example.com'
    fill_in "Password", :with => 'password'
    click_button "Log In"
    visit '/links/new'
    fill_in "link_headline", :with => 'This is amazing'
    fill_in "link_url", :with => ''
    click_button "Create Link"
    page.should have_content "Url can't be blank"
  end

  it "prevents a user from entering a link without essential fields" do
    user = User.create(:email => 'user@example.com', :password => 'password')
    link = Link.create(:headline => 'a', :url => 'a')
    visit '/sessions/new'
    fill_in "Email", :with => 'user@example.com'
    fill_in "Password", :with => 'password'
    click_button "Log In"
    visit '/links/new'
    fill_in "link_headline", :with => 'a'
    fill_in "link_url", :with => 'a'
    click_button "Create Link"
    page.should have_content "Url has already been taken"
    page.should have_content "Headline has already been taken"
  end
end
