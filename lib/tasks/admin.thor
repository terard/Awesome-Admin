require "./config/environment"

class Admin < Thor
  desc "listusers", "displays a list of users"
  def listusers
    list = []
    User.select(:username).each do |user|
      list << user.username
    end
    say list.join("\n")
  end
  
  desc "updatepassword", "finds user with username and changes password"
  def updatepassword(username,newpassword)
    say User.update_password(username,newpassword)
  end      
end