class Pet < ActiveRecord::Base
  attr_accessible :blz_id, :category, :description, :event, :icon_url, :nga_url, :season, :source, :status, :title_cn, :title_en, :url_param, :weather, :reviewed

  validate :blz_id, :title_cn, :source, presence: true
  validate :blz_id, uniqueness: true

  has_and_belongs_to_many :zones
  has_many :acquirings
  belongs_to :category
  has_many :skills, through: :acquirings
  has_many :categories_of_skills, through: :skills, source: :category

  def main_skill_category
    categories_of_skills.group('categories.id').order('count(*) desc').limit(1)
  end
end
