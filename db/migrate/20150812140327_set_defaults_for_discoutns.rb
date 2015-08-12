class SetDefaultsForDiscoutns < ActiveRecord::Migration
  def change
    change_column :discounts, :value_in_numbers, :integer, default: 0
    change_column :discounts, :value_in_decimal, :integer, default: 0
  end
end
