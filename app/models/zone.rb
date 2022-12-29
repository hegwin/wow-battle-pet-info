class Zone < ActiveRecord::Base
  has_and_belongs_to_many :pets

  validates :blz_id, :title_cn, presence: true, uniqueness: true

  include ActsAsTree
  acts_as_tree

  extend FriendlyId
  friendly_id :title_en, use: :slugged
end
