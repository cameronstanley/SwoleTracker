class User < ActiveRecord::Base
	attr_accessible :login, :email, :password, :password_confirmation

	has_many :exercise_entries

	acts_as_authentic do |c|
	end
end
