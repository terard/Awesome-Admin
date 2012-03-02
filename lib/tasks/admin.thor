require "./config/environment"

class Admin < Thor
  # desc "usercount", "gives a user count"
  # def usercount
  #   puts "there are #{User.count} users."
  # end
  
  # desc "finduser", "finds user by username"
  # def finduser(username)
  #   user = User.find_by_username username
  #   puts "#{user.id}"
  # end
  
  desc "createuser", "creates user with username and password"
  def createuser(username,password)
    user = User.create :username => username, :password => password
    puts "#{user.id}"
  end
  
  desc "updatepassword", "finds user with username and changes password"
  def updatepassword(username,newpassword)
    user = User.find_by_username(username)
    user.password = newpassword
    user.save
    puts "#{user.password_digest}"
  end    
      
end