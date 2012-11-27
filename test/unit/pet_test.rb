# encoding: utf-8
require 'test_helper'

class PetTest < ActiveSupport::TestCase
  fixtures :pets
  # test "the truth" do
  #   assert true
  # end

  test "pet attributes must not be empty" do
    pet = Pet.new
    assert pet.invalid?
    assert pet.errors[:blz_id].any?
    assert pet.errors[:title_cn].any?
    assert pet.errors[:source].any?
  end

  test "blizzard id must be unique" do
    pet = Pet.new(blz_id: pets(:hatchling).blz_id, title_cn: "野生赤红雏龙", source: "宠物对战")
    assert !pet.valid?
    assert pet.errors[:blz_id].any?
    pet.blz_id = 818
    assert pet.valid?
  end

  test "hatchling main skill category should be dragonkin" do
    pet = pets(:hatchling)
    assert_equal categories(:dragonkin), pet.main_skill_category
  end
end
