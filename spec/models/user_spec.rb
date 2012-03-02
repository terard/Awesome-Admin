require 'spec_helper'

describe do
  user = Factory( :user, :username => 'dexter', :password => 'secret',
                  :roles => {:admin => true, :sales => false, :maintenance => true})
  
  describe "A user" do
    it "can be instantiated" do
      user.should be_an_instance_of(User)
    end

    it "can be saved successfully" do
      user.should be_persisted
    end

    it "should fail with blank password" do  
      user.password = ''
      user.should_not be_valid
    end
  end
  
  describe "with roles" do
    it "should have admin role" do
      user.roles[:admin].should == true
    end
  
    it "should not have sales role" do
      user.roles[:sales].should == false
    end
  
    it "should not expose password" do
      User.find_by_username('dexter').password.should_not == 'password'
    end
  
    it "should have a role list" do
      user.role_list.should == "Admin, Maintenance"
    end
  end
end