class CreateExerciseEntries < ActiveRecord::Migration
  def change
    create_table :exercise_entries do |t|
      t.date :date
      t.integer :exercise_id
      t.integer :exercise_detail_id
      t.integer :user_id

      t.timestamps
    end
  end
end
