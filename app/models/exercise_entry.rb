class ExerciseEntry < ActiveRecord::Base
  attr_accessible :date, :exercise_detail_id, :exercise_id, :user_id
  belongs_to :exercise_detail, :dependent => :destroy
  belongs_to :exercise
  belongs_to :user, :dependent => :destroy
end
