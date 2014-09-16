jQuery ->
  $('#employee_select2').select2
    data: $('#employee_list').data('employees')
    placeholder: 'Please select employee'
    containerCssClass: 'form-control'