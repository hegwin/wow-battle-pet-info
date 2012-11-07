class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.integer :blz_id
      t.string :title_cn
      t.string :title_en
      t.text :description
      t.string :status
      t.string :icon_url
      t.string :source
      t.string :event
      t.string :weather
      t.string :season
      t.string :nga_url
      t.integer :category_id
      t.string :slug
      t.boolean :reviewed, default: false

      t.timestamps
    end

    add_index :pets, :blz_id
    add_index :pets, :title_cn
    add_index :pets, :title_en
    add_index :pets, :source
    add_index :pets, :event
    add_index :pets, :weather
    add_index :pets, :season
    add_index :pets, :category_id
    add_index :pets, :slug, unique: true
    add_index :pets, :reviewed
  end
end
