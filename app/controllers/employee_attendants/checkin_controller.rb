class EmployeeAttendants::CheckinController < ApplicationController

  before_action :authenticate_account!

  def new
    @employee_checkin = EmployeeAttendant.new
  end

  def create
    employee = Employee.find(employee_param[:employee_id])
    @checkin = employee.build_employee_attendant(set_employee_checkin_param)
    if @checkin.save
      redirect_to employee_attendants_path
    else
      render :new
    end
  end

  private

    def employee_param
      params.require(:employee_attendant).permit(:employee_id)
    end

    def set_employee_checkin_param
      {
        checkin_time: DateTime.now,
        checkin_status: 'pending'
      }
    end

end
