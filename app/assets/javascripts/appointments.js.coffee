jQuery ->
  $('#appointment_datetime_picker').datetimepicker()

  $('#customer_select2').select2
    data: $('#customer_list').data('customers')
    placeholder: 'Please select a customer'
    containerCssClass: 'form-control'

  $('#calendar').fullCalendar
    header:
      left: 'prev today next'
      center: 'title'
      right: 'month,agendaWeek,agendaDay'
    events: '/appointments.json'
    eventClick: (calEvent, jsEvent, view) ->
      editUrl = '/appointments/' + calEvent.id + '/edit'
      clearAppoingmentUrl = '/appointments/' + calEvent.id + '/clear_appointment'
      $('#appointment-detail-title').text(calEvent.title)
      $('#appointment-detail-client').text(calEvent.client)
      $('#appointment-detail-stylist').text(calEvent.stylist)
      $('#appointment-detail-time').text(calEvent.start)
      $('#appointment-detail-description').text(calEvent.description)
      $('#edit-appointment').attr('href', editUrl)
      $('#clear-appointment').attr('href', clearAppoingmentUrl)
      $('#appointment-detail').modal()