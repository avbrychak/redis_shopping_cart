$(document).on "page:change", ->
  $('a[data-remote]').on "ajax:success", (e, data, status, xhr) ->
    e.preventDefault()
    $this = $(this)
    $parentId = $(e.target).closest('tr').attr('id')
    if $this.data('action') == 'increase' || 'decrease'
      $('#' + $parentId + ' > .item-cart-count').html(data.item_cart_count)
      $('#' + $parentId + ' > .price-total').html(data.price_total)
      $('#' + $parentId + ' > .total-discount').html(data.total_discount)
      $('#' + $parentId + ' > .price-with-discount').html(data.price_with_discount)
      $('.cart-total-price').html(data.cart_total_price)
      $('.cart-total-discount').html(data.cart_total_discount)
      $('.cart-price-with-discount').html(data.cart_price_with_discount)
      $('.cart-count').html(data.cart_count)
      console.log($(this).data('action'))
    else if $(this).data('action') == 'delete'
      $itemToRemove = $(e.target).closest('tr').attr('id')
      console.log $itemToRemove
      $('.cart-count').html(data.cart_count)
      $('#' + $itemToRemove).remove()
