class CreateHealthEntries < ActiveRecord::Migration
  def change
    create_table :health_entries do |t|
      t.date :date
      t.float :weight
      t.float :body_fat
      t.float :body_water
      t.float :muscle_mass
      t.float :bone_mass
      t.integer :user_id

      t.timestamps
    end
  end
end
