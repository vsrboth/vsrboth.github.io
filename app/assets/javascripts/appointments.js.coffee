jQuery ->
  $('#appointment_datetime_picker').datetimepicker()

  $('#customer_select2').select2
    data: $('#customer_list').data('customers')
    placeholder: 'Please select customer'
    containerCssClass: 'form-control'

  $('#calendar').fullCalendar
    header:
      left: 'prev today next'
      center: 'title'
      right: 'month,agendaWeek,agendaDay'
    events: '/appointments.json'
    eventClick: (calEvent, jsEvent, view) ->
      $('#appointment-detail-title').text(calEvent.title)
      $('#appointment-detail-client').text(calEvent.client)
      $('#appointment-detail-stylist').text(calEvent.stylist)
      $('#appointment-detail-time').text(calEvent.start)
      $('#appointment-detail-description').text(calEvent.description)
      $('#appointment-detail').modal()

  $('#clear-appointment').on 'click', ->
    alert('click')