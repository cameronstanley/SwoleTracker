class HealthEntry < ActiveRecord::Base
  attr_accessible :body_fat, :body_water, :bone_mass, :date, :muscle_mass, :weight, :user_id
  belongs_to :user
end
