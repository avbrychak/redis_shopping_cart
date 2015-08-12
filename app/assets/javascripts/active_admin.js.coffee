#= require active_admin/base

$(document).ready ->
  handleDiscountVal()
  handleDiscountType()

handleDiscountVal = ->
  dec = $('#discount_value_in_decimal').parent()
  num = $('#discount_value_in_numbers').parent()
  percentField = $('#discount_is_percentage')

  setDiscountVal = ->
    if percentField.is(':checked')
      dec.show()
      num.hide()
    else
      dec.hide()
      num.show()

  setDiscountVal()


  percentField.click -> dec.toggle() and num.toggle()

handleDiscountType = ->
  checkboxes = $('#discount_products_input input[type="checkbox"]')
  select = $('#discount_category_id')

  select.change ->
    if $(@).val() isnt ''
      checkboxes.prop('checked', false)

  checkboxes.click ->
    select.val('')
