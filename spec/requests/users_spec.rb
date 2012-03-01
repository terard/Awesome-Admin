require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    it "displays users" do
      Factory(:user, :username => 'dexter', :password => 'secret')
      visit users_path
      find('#username').should have_content('dexter')
    end
  end
  
  describe "POST /users" do
    it "updates user password" do
      Factory(:user, :username => 'dexter', :password => 'secret')
      visit users_path
      click_link "change password"
      fill_in "user_password", :with => "newsecret"
      click_button "Change"
      page.should have_content("password had been changed")
    end
  end  
end
