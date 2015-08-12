class Discount < ActiveRecord::Base
  belongs_to :category
  has_many :discount_campaigns
  has_many :products, through: :discount_campaigns

  def calculate_discount(price)
    if is_percentage?
      price.to_f/100 * value_in_decimal
    else
      value_in_numbers
    end
  end
end
