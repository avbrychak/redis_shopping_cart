$(document).on "page:change", ->
  $('a[data-remote]').on "ajax:success", (e, data, status, xhr) ->
    $this = $(this)
    $parentId = $(e.target).closest('tr').attr('id')
    if $this.data('action') is 'increase' or 'decrease'
      console.log(data.cart_count)
      $('#' + $parentId + ' > .item-cart-count').html(data.item_cart_count)
      $('#' + $parentId + ' > .price-total').html(data.price_total)
      $('#' + $parentId + ' > .total-discount').html(data.total_discount)
      $('#' + $parentId + ' > .price-with-discount').html(data.price_with_discount)
      $('.cart-total-price').html(data.cart_total_price)
      $('.cart-total-discount').html(data.cart_total_discount)
      $('.cart-price-with-discount').html(data.cart_price_with_discount)
      $('.cart-count').html(data.cart_count)
  $('a.remove-button[data-remote]').on "ajax:success", (e, data, status, xhr) ->
    $itemToRemove = $(e.target).closest('tr').remove()
    $('.cart-count').html(data.cart_count)
    $('.cart-total-price').html(data.cart_total_price)
    $('.cart-total-discount').html(data.cart_total_discount)
    $('.cart-price-with-discount').html(data.cart_price_with_discount)



