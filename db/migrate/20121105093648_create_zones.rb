class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.integer :blz_id
      t.string :title_cn
      t.string :title_en
      t.integer :parent_id
      t.text :description
      t.string :slug

      t.timestamps
    end

    add_index :zones, :blz_id
    add_index :zones, :title_cn
    add_index :zones, :title_en
    add_index :zones, :parent_id
    add_index :zones, :slug, unique: true

  end
end
