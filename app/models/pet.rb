class Pet < ActiveRecord::Base
  attr_accessible :blz_id, :category, :category_id, :description, :event, :icon_url, :nga_url, :season, :source, :status, :title_cn, :title_en, :url_param, :weather, :reviewed

  validates :blz_id, :title_cn, :source, presence: true
  validates :blz_id, uniqueness: true

  has_and_belongs_to_many :zones
  has_many :acquirings
  belongs_to :category
  has_many :skills, through: :acquirings
  has_many :categories_of_skills, through: :skills, source: :category

  def self.exist_only_in(zone)
    self.find_by_sql(
      "select * from pets left join pets_zones on pets.id = pet_id where zone_id = #{zone.id} and pets.id in
        (select pets.id from pets right join pets_zones on pets.id = pet_id group by pets.id having count(pets.id) = 1)"
    )
    
  end
  
  def main_skill_category
    categories_of_skills.group('categories.id').order('count(*) desc').first
  end

  def forget_all_skills
    skills.clear
  end

  def acquire_skills(skills)
    skills.each do |skill|
      if skill[:title_cn].strip.size > 0  
        new_skill = Skill.find_by_title_cn(skill[:title_cn])
        acquirings.create(skill: new_skill, acquire_level: skill[:acquire_level]) if new_skill
      end
    end
  end
end
