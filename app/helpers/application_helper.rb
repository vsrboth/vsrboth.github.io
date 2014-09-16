module ApplicationHelper

  def is_setting_active?(controller)
    setting_controllers = [
      'settings',
      'membership_scoring_conditions',
      'staff_commision_conditions',
      'service_categories',
      'service_items'
    ]

    (setting_controllers.include? controller) ? true : false
  end

  def is_employee_setting?(controller)
    employee_setting_controllers = [
      'employees',
      'positions'
    ]
    (employee_setting_controllers.include? controller) ? true : false
  end

  def is_user_account_setting?(controller)
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
      render("shared/forms/#{association.to_s.singularize}", f: builder)
    end
    link_to(name, '#', class: 'add_fields', data: {id: id, fields: fields.gsub('\n', '')})
  end

  def format_datetime(value)
    (value == nil) ? nil : value.strftime('%d-%b-%Y %H:%M')
  end

  def toggle_filter_url(controller, action)
    if controller.eql? 'appointments'
      return appointments_path  if action.eql? 'index'
      return stylist_appointments_path if action.eql? 'stylist'
      return customer_appointments_path if action.eql? 'customer'
    end
  end

end

