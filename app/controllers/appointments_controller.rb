class AppointmentsController < ApplicationController

  before_action :authenticate_account!
  before_action :get_filter_date, only: [:index, :stylist, :customer]

  def index
    @appointments = Appointment.where(appointment_date: @filter_date.filtered_date)
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(set_appointment_param)
    if @appointment.save
      redirect_to appointments_path
    else
      render :new
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update_attributes(set_appointment_param)
      redirect_to appointments_path
    else
      render :edit
    end
  end

  def destroy
  end

  def stylist
    @stylists = Employee.joins(:appointments).where('appointments.appointment_date = ?', @filter_date.filtered_date)
  end

  def customer
    @customers = Client.joins(:appointments).where('appointments.appointment_date = ?', @filter_date.filtered_date)
  end

  private
    def set_appointment_param
      params.require(:appointment).permit(:client_id, :employee_id, :service_item_ids, :appointment_date, :appointment_time)
    end
end
