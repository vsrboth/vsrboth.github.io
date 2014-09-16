jQuery ->
  $('#service_item_select2').select2
    data: $('#service_items').data('items')
    placeholder: 'Select item'
    containerCssClass: 'form-control'

  $('#service_item_select2').on 'select2-selecting', (event) ->
    $('#invoice_invoice_details_new_price').val(event.object.price)