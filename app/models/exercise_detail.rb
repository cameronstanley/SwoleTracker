class ExerciseDetail < ActiveRecord::Base
  attr_accessible :sets, :reps, :weight
  has_many :exercise_entries, :dependent => :destroy
  has_many :exercises, :through => :exercise_entries

  validates_numericality_of :sets, :only_integer => true, :greater_than => 0, :message => "must be a number greater than 0."
  validates_numericality_of :reps, :only_integer => true, :greater_than => 0, :message => "must be a number greater than 0."
  validates_numericality_of :weight, :only_integer => true, :greater_than => 0, :message => "must be a number greater than 0."
end
