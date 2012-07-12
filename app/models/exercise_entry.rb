class ExerciseEntry < ActiveRecord::Base
  attr_accessible :date, :exercise_detail_id, :exercise_id
  belongs_to :exercise_detail
  belongs_to :exercise
end
