class CreateExerciseDetails < ActiveRecord::Migration
  def change
    create_table :exercise_details do |t|
      t.integer :sets
      t.integer :reps
      t.integer :weight

      t.timestamps
    end
  end
end
