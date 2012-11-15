class Pet < ActiveRecord::Base
  attr_accessible :blz_id, :category, :description, :event, :icon_url, :nga_url, :season, :source, :status, :title_cn, :title_en, :url_param, :weather

  validate :blz_id, :title_cn, :source, presence: true
  validate :blz_id, uniqueness: true

  has_and_belongs_to_many :zones
  has_many :acquirings
  belongs_to :category

  def skills
    Skill.find_by_sql "select skills.id,title_cn,description,blz_id,category_id,hit_rate from skills left join acquirings on skills.id = skill_id where pet_id = #{id} order by acquire_level"
  end
end
