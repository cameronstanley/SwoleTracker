class User < ActiveRecord::Base
	attr_accessible :login, :email, :password, :password_confirmation

	has_many :exercise_entries, :dependent => :destroy
	has_many :health_entries, :dependent => :destroy

	begin
		acts_as_authentic do |c|
		end
	rescue
	end
end
