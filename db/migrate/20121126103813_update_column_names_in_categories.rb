class UpdateColumnNamesInCategories < ActiveRecord::Migration
  def up
    remove_index :categories, :restrain_on
    remove_index :categories, :decay_with
    rename_column :categories, :restrain_on, :restrain_id
    rename_column :categories, :decay_with, :decay_id
    add_index :categories, :restrain_id
    add_index :categories, :decay_id
  end

  def down
    remove_index :categories, :restrain_id
    remove_index :categories, :decay_id
    rename_column :categories, :restrain_id, :restrain_on
    rename_column :categories, :decay_id, :decay_with
    add_index :categories, :restrain_on
    add_index :categories, :decay_with
  end
end
