class EmployeeAttendantsController < ApplicationController

  before_action :authenticate_account!

  def index
    @employee_attendants = EmployeeAttendant.where("DATE(checkin_time) = ? OR DATE(checkout_time) = ?", Date.today, Date.today)
    @employee_attendants = @employee_attendants.paginate(:page => params[:page], :per_page => 10)
  end

  def checkin_approve
    @employee = EmployeeAttendant.where(employee_id: params[:id], checkin_status: 'pending').take
    if @employee.update_attributes({checkin_status: 'approve'})
      redirect_to employee_attendants_path
    else
      redirect_to employee_attendants_path
    end
  end

  def checkin_deny
    @employee = EmployeeAttendant.where(employee_id: params[:id], checkin_status: 'pending').take
    if @employee.update_attributes({checkin_status: 'deny'})
      redirect_to employee_attendants_path
    else
      redirect_to employee_attendants_path
    end
  end

  def checkout_approve
    @employee = EmployeeAttendant.where(employee_id: params[:id], checkout_status: 'pending').take
    if @employee.update_attributes({checkout_status: 'approve'})
      redirect_to employee_attendants_path
    else
      redirect_to employee_attendants_path
    end
  end

  def checkout_deny
    @employee = EmployeeAttendant.where(employee_id: params[:id], checkout_status: 'pending').take
    if @employee.update_attributes({checkout_status: 'deny'})
      redirect_to employee_attendants_path
    else
      redirect_to employee_attendants_path
    end
  end

end
