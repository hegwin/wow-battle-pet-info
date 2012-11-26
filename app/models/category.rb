class Category < ActiveRecord::Base
  attr_accessible :blz_id, :comments, :decay_with, :features, :icon_url, :restrain_on, :title_cn, :title_en

  extend FriendlyId
  friendly_id :title_en, use: :slugged

  has_many :pets
  has_many :skills
  has_one :enemy, class_name: "Category", foreign_key: :restrain_on
  has_one :rookie, class_name: "Category", foreign_key: :decay_with
  belongs_to :restrain_on, class_name: "Category", foreign_key: :restrain_on
  belongs_to :decay_with, class_name: "Category", foreign_key: :decay_with
end
