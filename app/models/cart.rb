class Cart
  attr_reader :error, :product_count

  def initialize(cart)
    @cart = cart
    @error = ''
    @products_count = 0
  end

  def cart_products
    product_ids = $redis.hkeys(@cart)
    @cart_products ||= Product.includes(:discounts).where(id: product_ids).to_a
    @cart_products.each{|product| product.count_in_cart = $redis.hget(@cart, product.id) }
  end

  def errors?
    error.present?
  end

  def cart_products_count
    product_count = 0
    products_values = $redis.hgetall(@cart)
    if products_values.any?
      products_values.each_value do |value|
        product_count += value.to_i
      end
    end
    instance_variable_set(:@product_count, product_count)
  end

  def add_product_to_cart(product_id)
    if exists_in_cart?(product_id)
      increase(product_id)
    else
      $redis.hset(@cart, product_id, 1)
      @product_count += 1
    end
  end

  def remove_item_from_cart(product_id)
    item_count = $redis.hget(@cart, product_id)
    $redis.hdel(@cart, product_id)
    @product_count -= item_count.to_i
  end

  def increase(product_id)
    $redis.hincrby(@cart, product_id, 1)
    @product_count += 1
  end

  def item_count(product_id)
    item_count = $redis.hget(@cart, product_id)
    product = Product.find(product_id)
    product.count_in_cart = item_count.to_i
  end

  def decrease(product_id)
    item_count = $redis.hget(@cart, product_id)
    if item_count.to_i == 0
      product = Product.find(product_id)
      @error = "Cannot decrease #{product.name} count it's already 0"
    else
      $redis.hincrby(@cart, product_id, -1)
      @product_count -= 1
    end
  end

  def exists_in_cart?(product_id)
    $redis.hexists(@cart, product_id)
  end

  def total_price
    @total_price ||= cart_products.sum(&:total_price)
  end

  def price_with_discount
    @price_with_discount ||= cart_products.sum(&:price_with_discount)
  end

  def total_discount
    @total_discount ||= cart_products.sum(&:total_discount)
  end
end