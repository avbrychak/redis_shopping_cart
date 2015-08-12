class ChangeNameToString < ActiveRecord::Migration
  def change
    change_column :products, :name, :string
  end
end
