jQuery ->
  $('#timepicker').timepicker
    template: false
    showInputs: false
    minuteStep: 5

  $('#customer_select2').select2
    data: $('#customer_list').data('customers')
    placeholder: 'Please select customer'
    containerCssClass: 'form-control'

  $('#service_item_select2').select2
    data: $('#service_item_list').data('items')
    multiple: true
    containerCssClass: 'form-control'