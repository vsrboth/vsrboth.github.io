class AppointmentsController < ApplicationController

  before_action :authenticate_account!
  before_action :get_filter_date, only: [:index, :stylist, :customer]

  def index
    @appointments = Appointment.where("Date(start_time) = ?", @filter_date.filtered_date)
    respond_to do |format|
      format.html
      format.json { render json: @appointments.as_json }
    end
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

  def update_appointment_status
  end

  private
    def set_appointment_param
      params.require(:appointment).permit(:client_id, :employee_id, :title, :description, :start_time)
            .merge(end_time: DateTime.now)
    end
end
