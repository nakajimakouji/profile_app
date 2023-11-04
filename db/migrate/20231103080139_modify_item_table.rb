class ModifyItemTable < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :month, :integer, null: false
  end
  add_index :items, [:user_id, :category_id, :name, :month], unique: true
  remove_index :items, [:user_id, :category_id, :name], unique: true
end
