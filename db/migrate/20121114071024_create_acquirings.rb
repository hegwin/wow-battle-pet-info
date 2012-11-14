class CreateAcquirings < ActiveRecord::Migration
  def change
    create_table :acquirings do |t|
      t.integer :pet_id, null: false
      t.integer :skill_id, null: false
      t.integer :acquire_level, null: false

      t.timestamps
    end
    
    add_index :acquirings, :pet_id
    add_index :acquirings, :skill_id
    add_index :acquirings, :acquire_level
  end

  def down
    drop_table :acquirings
  end
end
