# encoding: utf-8
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "should generate a friendly id" do
    category = Category.new({blz_id: 100, title_cn: "懒惰的恶魔", title_en: "Lazy Demon"})
    assert category.save
    assert_equal "lazy-demon", category.slug
  end

  test "dragon's enemy should be humanoid" do
    dragon = categories(:dragonkin)
    assert_equal categories(:humanoid), dragon.enemy
  end
end
