class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.float :value_in_numbers
      t.decimal :value_in_decimal

      t.timestamps null: false
    end
  end
end
