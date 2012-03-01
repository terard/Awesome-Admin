require 'spec_helper'

describe User do
  let(:user) { Factory(:user, :username => 'dexter', :password => 'secret') }  
  
  it "can be instantiated" do
    user.should be_an_instance_of(User)
  end

  it "can be saved successfully" do
    user.should be_persisted
  end
  
  it "should authenticate with matching username and password" do
    user = Factory(:user, :username => 'dexter', :password => 'secret')
    User.find_by_username('dexter').try(:authenticate, 'secret').should == user
  end
end