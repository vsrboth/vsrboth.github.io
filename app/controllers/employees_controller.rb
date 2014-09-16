class EmployeesController < ApplicationController

  before_action :authenticate_account!
  before_action :current_employee, only: [:edit, :update]

  def index
    @employees = Employee.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
    @employee.communications.build
  end

  def create
    @employee = Employee.new(set_employee_param)
    if @employee.save
      redirect_to employees_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @employee.update_attributes(set_employee_param)
      redirect_to employees_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
    def set_employee_param
      params.require(:employee)
          .permit(:first_name, :last_name, :gender, :birthdate, :position_id, :address, :employment_status, :avatar, communications_attributes: [ :id, :_destroy, :field, :value ])
    end

    def current_employee
      @employee = Employee.find(params[:id])
    end
end
