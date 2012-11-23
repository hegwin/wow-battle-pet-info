# encoding: utf-8
require 'test_helper'

class ZoneTest < ActiveSupport::TestCase
  fixtures :zones
  # test "the truth" do
  #   assert true
  # end

  test "empty zone should be invalid" do
    zone = Zone.new
    assert zone.invalid?
    assert zone.errors[:blz_id].any?
    assert zone.errors[:title_cn].any?
  end
  
  test "chinese title and blzzard id should be unique" do
    zone = Zone.new(blz_id:      zones(:grey_valley).blz_id,
                    title_cn:    zones(:the_barren).title_cn,
                    title_en:    "Mysteria",
                    description: "Place of Mists",
                    parent_id:   1)
    assert !zone.save
    assert zone.errors[:blz_id].any?
    assert zone.errors[:title_cn].any?
  end

  test "generate a friendly id" do
    zone = Zone.new(blz_id: 30000,
                    title_cn: "测试区域",
                    title_en: "Test Zone")
    assert zone.save
    assert_equal 'test-zone', zone.slug
  end

  test "generate friend id sharing the indentical name" do
    zone = Zone.new(blz_id: 30001,
                   title_cn: '新灰谷',
                   title_en: zones(:grey_valley).title_en)
    assert zone.save
    assert_not_equal zones(:grey_valley).slug, zone.slug
  end

end
