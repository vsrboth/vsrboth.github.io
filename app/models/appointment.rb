class Appointment < ActiveRecord::Base

  ## Relations
  belongs_to :client
  belongs_to :employee

  ## Scopes
  scope :list, -> (filter_date, status) { where('DATE(start_time) = ? AND status = ?', filter_date, status)}


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
