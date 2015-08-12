class AddCategoryIdDiscount < ActiveRecord::Migration
  def change
    add_column :discounts, :category_id, :integer
    add_index :discounts, :category_id
  end
end
