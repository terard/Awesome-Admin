require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    it "displays users" do
      # Task.create!(:name => "paint fence")
      Factory(:user, :username => 'dexter', :password => 'secret')
      visit users_path
      page.should have_content("dexter")
    end
  end
end
