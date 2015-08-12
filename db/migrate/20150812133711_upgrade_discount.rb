class UpgradeDiscount < ActiveRecord::Migration
  def change
    add_column :discounts, :min_count, :integer, default: 0
    add_column :discounts, :is_percentage, :boolean, default: false
  end
end
