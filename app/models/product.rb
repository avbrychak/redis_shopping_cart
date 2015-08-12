class Product < ActiveRecord::Base
  attr_accessor :count_in_cart

  has_many :discount_campaigns
  has_many :discounts, through: :discount_campaigns
  belongs_to :category

  validates :category, :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }

  def total_price
    @total_price ||= price * count_in_cart.to_i
  end

  def price_with_discount
    @price_with_discount ||= total_price - total_discount
  end

  def total_discount
    @total_discount ||= begin
      all_discounts = discounts + Discount.where('min_count <= ? and ( category_id = ? OR category_id is NULL) ', count_in_cart, category_id)
      all_discounts.sum{ |disc| disc.calculate_discount(total_price) }
    end
  end
end
