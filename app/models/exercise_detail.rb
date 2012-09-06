class ExerciseDetail < ActiveRecord::Base
  attr_accessible :reps, :sets, :weight
  has_many :exercise_entries, :dependent => :destroy
  has_many :exercises, :through => :exercise_entries
  :dependent
end
