class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_cart

  def show
    @cart_products = @cart.cart_products
  end

  def add
    @cart.add_product_to_cart(params[:product_id])
    render json: @cart.product_count
  end

  def remove
    @cart.remove_item_from_cart(params[:product_id])
    render json: @cart.product_count
  end

  def increase_count
    @cart.increase(params[:product_id])
  end

  def decrease_count
    @cart.decrease(params[:product_id])
  end

  private

  def initialize_cart
    @cart = Cart.new("cart:#{current_user.id}")
    @cart_products_count = @cart.cart_products_count
  end

end
