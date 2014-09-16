module AppointmentsHelper

  def appointment_by_stylist(stylist)
    stylist.appointments.where(appointment_date: @filter_date.filtered_date)
  end

  def appointment_by_customer(customer)
    customer.appointments.where(appointment_date: @filter_date.filtered_date)
  end

  def service_list(appointment)
    list = appointment.service_item_ids.split(',')
    ServiceItem.where(id: list)
  end

end
