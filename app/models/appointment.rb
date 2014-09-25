class Appointment < ActiveRecord::Base
  belongs_to :client
  belongs_to :employee

  def as_json
    {
      id: id,
      title: title,
      description: description,
      start: DateTime.parse(start_time),
      client: self.client.full_name,
      stylist: self.employee.full_name,
      allDay: false
    }
  end

end
