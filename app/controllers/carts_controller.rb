class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_cart
  respond_to :js

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
    count_in_cart = @cart.item_count(params[:product_id])
    product = Product.find(params[:product_id])
    item_count = $redis.hget("cart:#{current_user.id}", product.id)
    product.count_in_cart = item_count
    price_total = product.total_price
    total_discount = product.total_discount
    price_with_discount = product.price_with_discount
    cart_total_price = @cart.total_price
    cart_total_discount = @cart.total_discount
    cart_price_with_discount = @cart.price_with_discount
    render json: {cart_count: @cart.product_count,
                  item_cart_count: count_in_cart,
                  price_total: price_total,
                  total_discount: total_discount,
                  price_with_discount: price_with_discount,
                  cart_total_price: cart_total_price,
                  cart_total_discount: cart_total_discount,
                  cart_price_with_discount: cart_price_with_discount}
  end

  def decrease_count
    @cart.decrease(params[:product_id])
    count_in_cart = @cart.item_count(params[:product_id])
    product = Product.find(params[:product_id])
    item_count = $redis.hget("cart:#{current_user.id}", product.id)
    product.count_in_cart = item_count
    price_total = product.total_price
    total_discount = product.total_discount
    price_with_discount = product.price_with_discount
    cart_total_price = @cart.total_price
    cart_total_discount = @cart.total_discount
    cart_price_with_discount = @cart.price_with_discount
    render json: {cart_count: @cart.cart_products_count,
                  item_cart_count: count_in_cart,
                  price_total: price_total,
                  total_discount: total_discount,
                  price_with_discount: price_with_discount,
                  cart_total_price: cart_total_price,
                  cart_total_discount: cart_total_discount,
                  cart_price_with_discount: cart_price_with_discount}
  end

  private

  def initialize_cart
    @cart = Cart.new("cart:#{current_user.id}")
    @cart_products_count = @cart.cart_products_count
  end

end
