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
    
  CSV.foreach("#{Rails.root}/db/data_src/zones.csv") do |blz_id, title_cn, parent_id, title_en|
    zone = Zone.new(blz_id: blz_id, title_cn: title_cn, title_en: title_en)
    if parent_id =~ /\d/
      parent_zone = Zone.find_by_blz_id(parent_id)
      zone.parent_id = parent_zone.id
    end
    zone.save
  end
end

Category.transaction do
  Category.delete_all
  CSV.foreach("#{Rails.root}/db/data_src/categories.csv") do |blz_id, title_cn, title_en, _, _, icon_url, features|
    if blz_id =~ /\d/
      Category.create(blz_id: blz_id, title_cn: title_cn, title_en: title_en, icon_url: icon_url, features: features)
    end
  end
  
  CSV.foreach("#{Rails.root}/db/data_src/categories.csv") do |line|
    if line[0] =~ /\d/
      #category = Category.find_all_by_blz_id([line[0], line[3], line[4]])
      category = Category.find_by_blz_id(line[0])
      restrain_on = Category.find_by_blz_id(line[3], select: :id)
      decay_with = Category.find_by_blz_id(line[4], select: :id)
      category.update_attributes({restrain: restrain_on, decay: decay_with})
    end
  end  
end

Pet.transaction do
  Pet.delete_all

  CSV.foreach("#{Rails.root}/db/data_src/pets.csv") do |blz_id, title_cn, category, source, _, icon_url, desc, zones |
    category = Category.find_by_title_en(category)
    pet = Pet.create(blz_id: blz_id, title_cn: title_cn, source: source, icon_url: icon_url, category: category, description: desc)
    pet.zones << Zone.find_all_by_title_cn(zones.split(',')) if zones =~ /./
    # for test    
=begin     
    if zones =~ /./
      zones.split(',').each do |zone|
        z = Zone.find_by_title_cn(zone)
        if z
          pet.zones << z
        else
          puts "unknown zone: #{zone}"
        end
      end
    end
=end
  end
end

Skill.transaction do
  Skill.delete_all
  CSV.foreach("#{Rails.root}/db/data_src/skills.csv") do |blz_id, title_cn, category, hit_rate, cd, description, _|
    if blz_id =~ /\d/ 
      category = Category.find_by_title_en(category)
      Skill.create(blz_id: blz_id, title_cn: title_cn, category: category, hit_rate: hit_rate, cd: cd, description: description)
    end
  end
end

Acquiring.transaction do
  Acquiring.delete_all

  CSV.foreach(File.join(Rails.root, 'db/data_src/pets_skills.csv')) do |line|
    if line[0] =~ /\d/
      if pet = Pet.find_by_blz_id(line[0])
        line[1..6].each_with_index do |blz_id, i|
          if blz_id.nil?
            next
          elsif skill = Skill.find_by_blz_id(blz_id)
            Acquiring.create(pet: pet, skill: skill, acquire_level: Skill::ACQUIRING_LEVEL[i])
          else
            puts "Warn: can't find skill whose blz_id = #{blz_id}"
          end
        end
      else
        puts "Warn: can't find pet whose blz_id = #{line[0]}"
      end
    end
  end
end
