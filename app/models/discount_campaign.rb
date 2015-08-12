class DiscountCampaign < ActiveRecord::Base
  belongs_to :discount
  belongs_to :product
end
