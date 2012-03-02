# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create :username => 'dexter',
            :password => 'secret',
            :roles => {:admin => true, :sales => false, :maintenance => true}
            
User.create :username => 'house',
            :password => 'secretly',
            :roles => {:admin => true, :sales => false, :maintenance => false}
            
User.create :username => 'sherlock',
            :password => 'secretest',
            :roles => {:admin => false, :sales => false, :maintenance => true}