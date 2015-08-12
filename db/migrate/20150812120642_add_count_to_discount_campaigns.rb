class AddCountToDiscountCampaigns < ActiveRecord::Migration
  def change
    add_column :discount_campaigns, :count, :integer
  end
end
