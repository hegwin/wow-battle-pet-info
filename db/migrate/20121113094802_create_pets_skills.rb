class CreatePetsSkills < ActiveRecord::Migration
  def up
    create_table :pets_skills do |t|
      t.integer :pet_id, null: false
      t.integer :skill_id, null: false
      t.integer :aquire_level, null: false
    end
    add_index :pets_skills, :pet_id
    add_index :pets_skills, :skill_id
    add_index :pets_skills, :aquire_level
  end

  def down
    drop_table :pets_skills
  end
end
