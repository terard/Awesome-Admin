class User < ActiveRecord::Base
  attr_accessible :username, :password
  has_secure_password
  # validates_presence_of :password, :on => :create
  
  ROLE_VALUES = ["admin", "sales", "maintenance"]
  # {:admin => true, :sales => false, :maintenance => true}  
  
  serialize :roles, Hash
end
