class CreateDiscountCampaigns < ActiveRecord::Migration
  def change
    create_table :discount_campaigns do |t|
      t.string :name
      t.text :description
      t.references :discount, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
