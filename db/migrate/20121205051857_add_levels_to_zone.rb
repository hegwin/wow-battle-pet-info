class AddLevelsToZone < ActiveRecord::Migration
  def up
    add_column :zones, :zone_level, :string
    add_column :zones, :pet_level, :string
    add_index :zones, :zone_level
    add_index :zones, :pet_level
  end

  def down
    remove_index :zones, :pet_level
    remove_index :zones, :zone_level
    remove_column :zones, :pet_level
    remove_column :zones, :zone_level
  end
end
