module PetsHelper
  def show_hit_rate(number)    
    if number >= 100
      nil
    else
      number_to_percentage number, precision: 0
    end
  end

  def reviewed_label(flag)
    if flag
      label_tag 'reviewed', 'Reviewed', class: "label label-success"
    else
      label_tag 'reviewed', 'Unreviewed', class: "label"
    end
  end

  def list_skill_icons(pet)
    pet.acquirings.order(:acquire_level).map {|a| image_tag "skills/#{a.skill.blz_id}.jpg", size: "24x24"}.join('')
  end

  def acquirings_hash(acquirings)
    hash = {}
    acquirings.each {|s| hash[s.acquire_level] = s}
    hash
  end
end
