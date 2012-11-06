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

end
