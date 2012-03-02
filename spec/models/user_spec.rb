require 'spec_helper'

describe User do
  let(:user) { Factory(:user, :username => 'dexter', :password => 'secret', :roles => {:admin => true, :sales => false, :maintenance => true}) }  
  
  it "can be instantiated" do
    user.should be_an_instance_of(User)
  end

  it "can be saved successfully" do
    user.should be_persisted
  end
  
  it "should authenticate with matching username and password" do
    user = Factory(:user, :username => 'dexter')
    User.find_by_username('dexter').try(:authenticate, 'secret').should == user
  end
  
  it "should authenticate after passoword change" do
    user.password = 'newsecret'
    user.save
    User.find_by_username('dexter').try(:authenticate, 'newsecret').should == user
  end
  
  it "should not authenticate with old password after passoword change" do
    user.password = 'newsecret'
    user.save
    User.find_by_username('dexter').try(:authenticate, 'secret').should_not == user
  end
  
  it "should have admin role" do
    user = Factory( :user, :username => 'dexter', :password => 'secret',
                    :roles => {:admin => true, :sales => false, :maintenance => true})
    user.roles[:admin].should == true
  end
  
  it "should not have sales role" do
    user = Factory( :user, :username => 'dexter', :password => 'secret',
                    :roles => {:admin => true, :sales => false, :maintenance => true})
    user.roles[:sales].should == false
  end
  
  it "should not expose password" do
    Factory(:user, :username => 'dexter')
    User.find_by_username('dexter').password.should_not == 'password'
  end
  
  it "should have a role list" do
    user.role_list.should == "Admin Maintenance"
  end
end