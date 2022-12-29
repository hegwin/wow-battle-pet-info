class Skill < ActiveRecord::Base
  has_many :acquirings
  has_many :pets, through: :acquirings
  belongs_to :category

  validates :blz_id, presence: true, uniqueness: true
  validates :title_cn, :category_id, :description, presence: true

  extend FriendlyId
  friendly_id :title_en, use: :slugged

  ACQUIRING_LEVEL = [1, 2, 4, 10, 15, 20]


end
