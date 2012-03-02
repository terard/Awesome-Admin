class User < ActiveRecord::Base
  attr_accessible :username, :password, :roles
  has_secure_password
  # validates_presence_of :password, :on => :create
  
  ROLE_VALUES = ["admin", "sales", "maintenance"]

  serialize :roles, Hash
  
  def role_list
    list = []
    roles.each do |key,value|
      list << key.to_s.titleize if value
    end
    list.join(" ")
  end
end
