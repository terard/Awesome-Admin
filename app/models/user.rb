class User < ActiveRecord::Base
  attr_accessible :username, :password, :roles
  has_secure_password
  validates_presence_of :password, :message => "can't be blank"
  
  ROLE_VALUES = ["admin", "sales", "maintenance"]

  serialize :roles, Hash
  
  def self.update_password(username,password)
    user = find_by_username username
    if user
      user.password = password
      user.save!
    else
      false
    end
  end
  
  def role_list
    list = []
    roles.each do |key,value|
      list << key.to_s.titleize if value
    end
    list.join(", ")
  end
end
