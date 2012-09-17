# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create exercises
Exercise.create!(:title => "Squat")
Exercise.create!(:title => "Overhead Press")
Exercise.create!(:title => "Deadlift")
Exercise.create!(:title => "Bench Press")
Exercise.create!(:title => "Power Clean")

# Create test user
User.create!(:login => "test", :email => "email@gmail.com", :password => "abc123", :password_confirmation => "abc123")