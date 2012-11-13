class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer :blz_id, null: false
      t.string :title_cn, null: false
      t.string :title_en
      t.text :description
      t.integer :hit_rate
      t.integer :category_id, null: false
      t.integer :cd
      t.string :status
      t.string :slug
      t.text :comments

      t.timestamps
    end

    add_index :skills, :blz_id
    add_index :skills, :title_cn
    add_index :skills, :title_en
    add_index :skills, :hit_rate
    add_index :skills, :cd
    add_index :skills, :status
    add_index :skills, :slug, unique: true
  end
end
