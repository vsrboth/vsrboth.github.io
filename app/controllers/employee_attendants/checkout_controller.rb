class EmployeeAttendants::CheckoutController < ApplicationController

  before_action :authenticate_account!

  def new
    @employee_checkout = EmployeeAttendant.new
  end

  def create
    employee = Employee.find(employee_param[:employee_id])
    @checkout = employee.employee_attendant
    if @checkout.update_attributes(set_employee_checkout_param)
      redirect_to employee_attendants_path
    else
      render :new
    end
  end

  private

    def employee_param
      params.require(:employee_attendant).permit(:employee_id)
    end

    def set_employee_checkout_param
      {
        checkout_time: DateTime.now,
        checkout_status: 'pending'
      }
    end

end
