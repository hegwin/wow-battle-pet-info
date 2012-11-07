class Pet < ActiveRecord::Base
  attr_accessible :blz_id, :category_id, :description, :event, :icon_url, :nga_url, :season, :source, :status, :title_cn, :title_en, :url_param, :weather

  validate :blz_id, :title_cn, :source, presence: true
  validate :blz_id, uniqueness: true

  has_and_belongs_to_many :zones
  belongs_to :category
end
