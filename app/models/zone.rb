class Zone < ActiveRecord::Base
  attr_accessible :blz_id, :description, :parent_id, :title_cn, :title_en
end
