class Skill < ActiveRecord::Base
  attr_accessible :blz_id, :category, :cd, :comments, :description, :hit_rate, :status, :title_cn, :title_en

  has_many :acquirings
  belongs_to :category
end
