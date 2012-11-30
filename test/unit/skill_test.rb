# encoding: utf-8
require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  test "skill with empty attributes must not be valid" do
    skill = Skill.new
    assert !skill.save
    assert skill.errors[:blz_id].any?
    assert skill.errors[:title_cn].any?
    assert skill.errors[:category_id].any?
    assert skill.errors[:description].any?
  end

  test "blizzard id should be unique" do
    skill = Skill.new(blz_id: skills(:call_lightning).blz_id, 
                      title_cn: '回馈',
                      category: categories(:magic),
                      description: "朝敌人发起法力激涌,造成20点魔法伤害",
                      hit_rate: 100)
    assert !skill.save
    skill.blz_id = 484
    assert skill.valid?
  end

  test "generate friendly id" do
    skill = Skill.new(blz_id:      572,
                      title_cn:    "泥石流",
                      category:    categories(:critter),
                      description: "Calls down a mudslide, deadling 30 damage and causing muddy weather for 9 rounds",
                      title_en:    "Mud slide",
                      cd:          3,
                      hit_rate:    100)
    assert skill.save
    assert_equal "mud-slide", skill.slug
  end
end
