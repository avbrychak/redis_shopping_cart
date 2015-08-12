class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :name
      t.text :description
      t.float :price
      t.integer :available_count

      t.timestamps null: false
    end
  end
end
