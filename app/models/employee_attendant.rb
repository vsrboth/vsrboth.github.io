class EmployeeAttendant < ActiveRecord::Base
  belongs_to :employee

  delegate :full_name, :staff_id, to: :employee
end
