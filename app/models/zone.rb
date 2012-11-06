class Zone < ActiveRecord::Base
  include ActsAsTree
  attr_accessible :blz_id, :description, :parent_id, :title_cn, :title_en

  validates :blz_id, :title_cn, presence: true
  validates :blz_id, :title_cn, uniqueness: true

  acts_as_tree
end
