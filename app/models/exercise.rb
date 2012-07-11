class Exercise < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :exercise_entries
  has_many :exercise_details, :through => :exercise_entries
end
