module EmployeesHelper

  def employee_position(employee)
    Position.find(employee.position_id).title
  end

end
