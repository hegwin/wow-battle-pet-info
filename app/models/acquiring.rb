class Acquiring < ActiveRecord::Base
  attr_accessible :pet, :skill, :acquire_level

  validate :pet_id, :skill_id, :acquire_level, presence: true

  belongs_to :pet
  belongs_to :skill
end
