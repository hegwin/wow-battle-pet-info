class Acquiring < ApplicationRecord
  validates :pet_id, :skill_id, :acquire_level, presence: true

  belongs_to :pet
  belongs_to :skill
end
