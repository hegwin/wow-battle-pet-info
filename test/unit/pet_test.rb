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
    flunk
  end
end
