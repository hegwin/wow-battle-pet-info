class Category < ActiveRecord::Base
  attr_accessible :blz_id, :comments, :decay_with, :features, :icon_url, :restrain_on, :slug, :title_cn, :title_en

  extend FriendlyId
  friendly_id :title_en, use: :slugged

  has_many :pets

  def enemy
    Category.find_by_restrain_on self.id
  end

  def rookie
    Category.find_by_decay_with self.id
  end
end
