class Skill < ActiveRecord::Base
  attr_accessible :blz_id, :category, :cd, :comments, :description, :hit_rate, :status, :title_cn, :title_en

  has_and_belongs_to_many :pets
  belongs_to :category
end
