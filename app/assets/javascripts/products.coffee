# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
  $('a.add-to-cart-button[data-remote]').on "ajax:success", (e, data, status, xhr) ->
    e.preventDefault()
    $('.cart-count').html(data)
