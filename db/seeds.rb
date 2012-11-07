require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Zone.transaction do
  Zone.delete_all
    
  CSV.foreach("#{Rails.root}/db/data_src/zones.csv") do |blz_id, title_cn, parent_id|
    zone = Zone.new(blz_id: blz_id, title_cn: title_cn)
    if parent_id =~ /\d/
      parent_zone = Zone.find_by_blz_id(parent_id)
      zone.parent_id = parent_zone.id
    end
    zone.save
  end
end

Pet.transaction do
  Pet.delete_all

  CSV.foreach("#{Rails.root}/db/data_src/pets.csv") do |blz_id, title_cn, _, source, _, icon_url |
    Pet.create(blz_id: blz_id, title_cn: title_cn, source: source, icon_url: icon_url)
  end

end
