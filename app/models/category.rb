class Category < ActiveRecord::Base
  attr_accessible :blz_id, :comments, :decay_with, :features, :icon_url, :restrain_on, :slug, :title_cn, :title_en
end
