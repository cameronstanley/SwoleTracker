class User < ActiveRecord::Base
	attr_accessible :login, :email, :password, :password_confirmation

	has_many :exercise_entries , :dependent => :destroy

	acts_as_authentic do |c|
	end
end
