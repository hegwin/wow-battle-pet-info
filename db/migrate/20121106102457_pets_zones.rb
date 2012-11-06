class PetsZones < ActiveRecord::Migration
  def up
    create_table :pets_zones do |t|
      t.integer :pet_id, null: false
      t.integer :zone_id, null:false
    end

    add_index :pets_zones, :pet_id
    add_index :pets_zones, :zone_id
    add_index :pets_zones, [:pet_id, :zone_id]
  end

  def down
    drop_table :pets_zones
  end
end
