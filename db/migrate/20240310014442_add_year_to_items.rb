class AddYearToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :year, :integer, null: false, default: 2024
    add_index :items, [:user_id, :category_id, :name, :month, :year], unique: true, name: 'index_items_on_user_category_name_month_year'
    remove_index :items, [:user_id, :category_id, :name, :month], unique: true
  end
end
