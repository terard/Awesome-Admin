require 'spec_helper'

describe "Users" do
  
  describe "GET /users" do
    before do
      Factory(:user, :roles => {:admin => true, :sales => false, :maintenance => true})
    end
    
    it "displays users" do
      visit users_path
      page.should have_content('dexter')
    end
    
    it "displays user roles" do
      visit users_path
      page.should have_content('Admin, Maintenance')
    end
    
    it "displays user roles" do
      visit users_path
      page.should_not have_content('Sales')
    end
  end

  describe "POST /users" do
    before do
      Factory(:user, :roles => {:admin => true, :sales => false, :maintenance => true})
    end
    
    it "updates user password" do
      visit users_path
      click_link "change password"
      fill_in "user_password", :with => "newsecret"
      click_button "Change"
      page.should have_content("password had been changed")
    end
    
    it "fails with blank password" do
      visit users_path
      click_link "change password"
      fill_in "user_password", :with => ""
      click_button "Change"
      
      page.should have_content("Password can't be blank")
    end
  end  
end
