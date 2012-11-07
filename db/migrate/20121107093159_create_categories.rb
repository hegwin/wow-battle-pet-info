class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :blz_id
      t.string :title_cn
      t.string :title_en
      t.string :icon_url
      t.text :features
      t.integer :decay_with
      t.integer :restrain_on
      t.string :slug
      t.text :comments

      t.timestamps
    end

    add_index :categories, :blz_id
    add_index :categories, :title_cn
    add_index :categories, :title_en
    add_index :categories, :icon_url
    add_index :categories, :decay_with
    add_index :categories, :restrain_on
    add_index :categories, :slug, unique: true
  end
end
