class Category < ActiveRecord::Base
  attr_accessible :blz_id, :comments, :decay, :features, :icon_url, :restrain, :title_cn, :title_en, :decay_id, :restrain_id

  extend FriendlyId
  friendly_id :title_en, use: :slugged

  has_many :pets
  has_many :skills
  has_one :enemy, class_name: "Category", foreign_key: :restrain_id
  has_one :rookie, class_name: "Category", foreign_key: :decay_id
  belongs_to :restrain, class_name: "Category"
  belongs_to :decay, class_name: "Category"
end
