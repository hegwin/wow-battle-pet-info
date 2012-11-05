class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.integer :blz_id
      t.string :title_cn
      t.string :title_en
      t.integer :parent_id
      t.text :description

      t.timestamps
    end
  end
end
